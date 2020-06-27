//
//  OfflineODataServiceStep.swift
//  Fiori4iOS MultiPattern
//
//  Created by Stan Stadelman on 1/31/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOfflineOData
import Combine

open class ODataOnboardingStep: OnboardingStep {
    private let logger = Logger.shared(named: "ODataOnboardingStep")
    private var subscriptions = Set<AnyCancellable>()
    
    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.restore(context: context, completionHandler: completionHandler)
    }
    
    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.configureODataStore(using: context)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.logger.error("Restore Offline Store failed", error: error)
                    completionHandler(.failed(error))
                }
            }, receiveValue: { result in
                completionHandler(.success(context))
            })
            .store(in: &subscriptions)
    }
    
    public func reset(context: OnboardingContext, completionHandler: @escaping () -> Void) {
        OfflineODataController.shared.removeOfflineStore(for: context.onboardingID)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.logger.error("Remove Offline Store failed", error: error)
                    completionHandler()
                }
            }, receiveValue: { _ in
                completionHandler()
            })
            .store(in: &subscriptions)
    }
    
    private func configureODataStore(using context: OnboardingContext) -> Future<OnboardingResult, OfflineODataController.Error> {
        return Future { promise in
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent("com.sap.edm.sampleservice.v2").absoluteString)!
            
//            // Sink on changes to store state, to update End User re: status
//            OfflineODataController.shared.storeState
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: { state in
//                    context.presentationDelegate.setInfoText("\(state.debugDescription)")
//                })
//                .store(in: &self.subscriptions)
            
            // Boostrap data service
            OfflineODataController.shared.bootstrapDataService(sapURLSession: context.sapURLSession,
                                                                     serviceRoot: configurationURL,
                                                                     onboardingID: context.onboardingID)
                // open offline store (provider of `DataService<OfflineODataProvider>(provider: ...)`)
                .receive(on: RunLoop.main)
                .flatMap({ _ in
                    OfflineODataController.shared.openOfflineStore(synchronized: true)
                })
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        self.logger.error("Configure Offline Store failed", error: error)
                        return promise(.failure(error))
                    }
                }, receiveValue: { _ in
                    return promise(.success(.success(context)))
                })
                .store(in: &self.subscriptions)
        }
    }
}
