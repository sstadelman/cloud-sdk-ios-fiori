//
//  OfflineODataStoreStatus.swift
//  Fiori4iOS MultiPattern
//
//  Created by Stadelman, Stan on 2/3/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SAPOfflineOData

extension OfflineODataStoreState: CustomDebugStringConvertible {
    public var debugDescription: String {
        var result = ""
        if contains(.opening) {
            result += ":opening"
        }
        if contains(.open) {
            result += ":open"
        }
        if contains(.closed) {
            result += ":closed"
        }
        if contains(.downloading) {
            result += ":downloading"
        }
        if contains(.uploading) {
            result += ":uploading"
        }
        if contains(.initializing) {
            result += ":initializing"
        }
        if contains(.fileDownloading) {
            result += ":fileDownloading"
        }
        if contains(.initialCommunication) {
            result += ":initialCommunication"
        }
        return result
    }
    
    public var isNetworkActive: Bool {
        return contains(.downloading) ||
            contains(.uploading) ||
            contains(.fileDownloading) ||
            contains(.initialCommunication)
    }
    
    public var setupProgress: Float {
        var value: Float = 0.05
        switch self {
        case let x where x.contains(.opening):
            value = 0.1
            fallthrough
        case let x where x.contains(.initializing):
            value += 0.1
            fallthrough
        case let x where x.contains(.initialCommunication):
            value += 0.1
            fallthrough
        case let x where x.contains(.open):
            value = 0.5
            fallthrough
        case let x where x.contains(.uploading):
            value += 0.2
            fallthrough
        case let x where x.contains(.downloading):
            value += 0.2
            fallthrough
        case let x where x.contains(.fileDownloading):
            value += 0.05
            fallthrough
        default:
            break
        }
        return value
    }
}
