//
//  ReferenceAppDelegate+Connectivity.swift
//  Reference
//
//  Created by Stan Stadelman on 6/26/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPFioriFlows

// MARK: - ConnectivityObserver implementation

extension ReferenceAppDelegate: ConnectivityObserver {
    func connectionEstablished() {
        // connection established
        self.logger.info("Connection established.")
    }

    func connectionChanged(_ previousReachabilityType: ReachabilityType, reachabilityType _: ReachabilityType) {
        // connection changed
        self.logger.info("Connection changed.")
        if case previousReachabilityType = ReachabilityType.offline {
            // connection established
            OnboardingSessionManager.shared.open { error in
                if let error = error {
                    self.logger.error("Error in opeing session", error: error)
                }
            }
        }
    }

    func connectionLost() {
        // connection lost
        self.logger.info("Connection lost.")
    }
}
