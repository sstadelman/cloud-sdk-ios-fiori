//
//  OfflineODataController.swift
//  Fiori4iOS MultiPattern
//
//  Created by Stan Stadelman on 1/31/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import SAPOfflineOData
import Combine

//class AModel: ObservableObject {
//    @Published var steps = [String: OfflineODataProviderProgressReporting]()
//}


public class OfflineODataController: ObservableObject {
    
    public enum Error: Swift.Error {
        case cannotCreateOfflinePath
        case storeClosed
        case offlineOData(OfflineODataError)
    }

    public static let shared = OfflineODataController()
    public var dataService: ESPMContainer<OfflineODataProvider>!
    
    private let logger = Logger.shared(named: "OfflineODataController")
    private var subscriptions = Set<AnyCancellable>()
    private let progressNotificationQueue = OperationQueue()
    
    @Published var steps = [String: OfflineODataProviderProgressReporting]() {
        didSet {
            print(steps)
            objectWillChange.send()
        }
    }

    private init() {}

    // MARK: - Store lifecycle methods
    
    open func openOfflineStore(synchronized: Bool) -> Future<Void, Error> {
        return Future { promise in
            
            self.dataService.provider.open()
                .mapError({ Error.offlineOData($0) })
                // if !synchronized, return `finished` to the sink
                .drop(while: { !synchronized })
                // call `synchronize()` wrapper on uploadOfflineStore() & downloadOfflineStore()
                .flatMap({ _ in self.synchronize() })
                .sink(receiveCompletion: { [self] completion in
                    switch completion {
                    case .finished:
                        logger.info("Store open \(synchronized ? "and sync" : "") success.")
                        return promise(.success(()))
                    case .failure(let error):
                        logger.error("Open offline store failed.", error: error)
                        return promise(.failure(error))
                    }
                }, receiveValue: {})
                .store(in: &self.subscriptions)
        }
    }

    open func closeOfflineStore() -> Future<Void, OfflineODataError> {
        return Future { promise in
            do {
                try self.dataService.provider.close()
                return promise(.success(()))
            } catch {
                return promise(.failure(error as! OfflineODataError))
            }
        }
    }
    
    open func removeOfflineStore(for onboardingID: UUID) -> Future<Void, Error> {
        return Future { promise in
            self.offlineStorePath(for: onboardingID)
                .flatMap({ path in
                    return OfflineODataProvider.clear(at: path)
                        .mapError({ error in OfflineODataController.Error.offlineOData(error) })
                })
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        return promise(.failure(error))
                    }
                }, receiveValue: { _ in
                    return promise(.success(()))
                })
                .store(in: &self.subscriptions)
        }
    }
    
    open func synchronize() -> Future<Void, Error> {
        return Future { promise in
            
            self.dataService.provider.open()
                .flatMap({ self.uploadOfflineStore() })
                .flatMap({ self.downloadOfflineStore() })
                .mapError({ Error.offlineOData($0) })
                .sink(receiveCompletion: { [self] completion in
                    if case .failure(let error) = completion {
                        logger.error("Store synchronization failed.", error: error)
                        return promise(.failure(error))
                    }
                }, receiveValue: { [self] in
                    logger.info("Store synchronization success.")
                    return promise(.success(()))
                })
                .store(in: &self.subscriptions)
        }
    }
    
    // MARK: - Data Service setup
    
    open func bootstrapDataService(sapURLSession: SAPURLSession, serviceRoot: URL, onboardingID: UUID) -> Future<Void, OfflineODataController.Error> {
        return Future { promise in
            
            // Get URL path for offline odata database
            self.offlineStorePath(for: onboardingID)
                // Initialize OfflineODataProvider at path, with onboarding context attributes
                .tryMap ({ offlinePath -> OfflineODataProvider in
                    let offlineParameters = OfflineODataParameters()
                    offlineParameters.storePath = offlinePath
                    offlineParameters.enableRepeatableRequests = true
                    
                    return try OfflineODataProvider(serviceRoot: serviceRoot, parameters: offlineParameters, sapURLSession: sapURLSession, delegate: self)
                })
                // Apply DefiningQueries to offline odata database
                .tryMap({ [self] provider -> OfflineODataProvider in
                    try applyDefiningQueries(to: provider)
                    return provider
                })
                // convert errors to expected type
                .mapError({ error -> OfflineODataController.Error in  .offlineOData(error as! OfflineODataError) })
                // on success, set `DataService` instance
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        return promise(.failure(error))
                    }
                }, receiveValue: { [self] provider in
                    dataService = ESPMContainer(provider: provider)
                    return promise(.success(()))
                })
                .store(in: &self.subscriptions)
        }
    }

    // MARK: - Utilities
    
    private func offlineStorePath(for onboardingID: UUID) -> Future<URL, Error> {
        return Future { promise in
            
            guard let documentsFolderURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
                promise(.failure(.cannotCreateOfflinePath))
                return
            }
            
            let offlineStoreURL = documentsFolderURL.appendingPathComponent(onboardingID.uuidString)
            
            CurrentValueSubject<URL, OfflineODataController.Error>(offlineStoreURL)
                .tryMap({ url -> URL in
                    try Foundation.FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
                    return url
                })
                .mapError({ _ in OfflineODataController.Error.cannotCreateOfflinePath })
                .sink(receiveCompletion: { (completion) in
                    if case .failure(let error) = completion {
                        return promise(.failure(error))
                    }
                }, receiveValue: { (url) in
                    return promise(.success(url))
                })
                .store(in: &self.subscriptions)
            
        }
    }

    private func applyDefiningQueries(to provider: OfflineODataProvider) throws {

        for set in ESPMContainerMetadata.EntitySets.allCases {
            let query = DataQuery()
                .from(set)
                .selectAll()
            let dq = OfflineODataDefiningQuery(name: set.localName,
                                               query: query,
                                               automaticallyRetrievesStreams: false)
            try provider.add(definingQuery: dq)
        }
    }
    
    private func downloadOfflineStore() -> Future<Void, OfflineODataError> {
        return Future { promise in
            self.dataService.download { [self] error in
                guard let error = error else {
                    logger.info("Offline Store successfully downloaded")
                    return promise(.success(()))
                }
                logger.error("Offline Store download failed", error: error)
                return promise(.failure(error))
            }
        }
    }

    private func uploadOfflineStore() -> Future<Void, OfflineODataError> {
        return Future { promise in
            self.dataService.upload { [self] error in
                guard let error = error else {
                    logger.info("Offline Store successfully uploaded.")
                    return promise(.success(()))
                }
                logger.error("Offline Store upload failed.", error: error)
                return promise(.failure(error))
            }
        }
    }
}

extension OfflineODataController: OfflineODataProviderDelegate {
    public func offlineODataProvider(_ provider: OfflineODataProvider, didUpdateOpenProgress progress: OfflineODataProviderOperationProgress) {
        updateModel(for: progress)
    }
    
    public func offlineODataProvider(_ provider: OfflineODataProvider, didUpdateDownloadProgress progress: OfflineODataProviderDownloadProgress) {
        updateModel(for: progress)
    }
    
    public func offlineODataProvider(_ provider: OfflineODataProvider, didUpdateUploadProgress progress: OfflineODataProviderOperationProgress) {
        updateModel(for: progress)
    }
    
    public func offlineODataProvider(_ provider: OfflineODataProvider, requestDidFail request: OfflineODataFailedRequest) {
        // break
    }
    
    public func offlineODataProvider(_ provider: OfflineODataProvider, didUpdateSendStoreProgress progress: OfflineODataProviderOperationProgress) {
        updateModel(for: progress)
    }
    
    private func updateModel(for progress: OfflineODataProviderProgressReporting) {
        DispatchQueue.main.async {
            self.steps[progress.operationId] = progress
        }
    }
    
}

