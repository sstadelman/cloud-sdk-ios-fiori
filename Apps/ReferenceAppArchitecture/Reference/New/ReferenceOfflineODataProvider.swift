//
//  OfflineODataProvider.swift
//  Fiori4iOS MultiPattern
//
//  Created by Stadelman, Stan on 2/1/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SAPOfflineOData
import Combine

extension OfflineODataProvider {
     
    func upload() -> Future<Void, OfflineODataError> {
        return Future { promise in
            self.upload { (error) in
                guard let error = error else {
                    return promise(.success(()))
                }
                return promise(.failure(error))
            }
        }
    }
    
    func open() -> Future<Void, OfflineODataError> {
        return Future { promise in
            self.open { (error) in
                guard let error = error else {
                    return promise(.success(()))
                }
                return promise(.failure(error))
            }
        }
    }
    
    static func clear(at path: URL) -> Future<Void, OfflineODataError> {
        return Future { promise in
            do {
                try OfflineODataProvider.clear(at: path, withName: nil)
                return promise(.success(()))
            } catch {
                return promise(.failure(error as! OfflineODataError))
            }
        }
    }
}
