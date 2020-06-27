//
//  OfflineODataControllerKey.swift
//  Reference
//
//  Created by Stan Stadelman on 6/26/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI

struct OfflineODataControllerKey: EnvironmentKey {
    
    static let defaultValue: Comsapedmsampleservicev2OfflineODataController = Comsapedmsampleservicev2OfflineODataController()
    
}

extension EnvironmentValues {
    var offlineODataController: Comsapedmsampleservicev2OfflineODataController {
        get {
            return self[OfflineODataControllerKey.self]
        }
        set {
            self[OfflineODataControllerKey.self] = newValue
        }
    }
}
