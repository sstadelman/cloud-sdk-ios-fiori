//
//  OnboardingSessionManagerKey.swift
//  Reference
//
//  Created by Stan Stadelman on 6/25/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SwiftUI
import SAPFioriFlows

struct OnboardingSessionManagerKey: EnvironmentKey {
    
    static let defaultValue: OnboardingSessionManager<OnboardingSession> =  OnboardingSessionManager(presentationDelegate: AppUILifecycleManager.shared, flowProvider: OnboardingFlowProvider(), onboardingIDManager: SingleUserOnboardingIDManager(), delegate: OnboardingErrorHandler())
    
}

extension EnvironmentValues {
    var onboardingSessionManager: OnboardingSessionManager<OnboardingSession> {
        get {
            return self[OnboardingSessionManagerKey.self]
        }
        set {
            self[OnboardingSessionManagerKey.self] = newValue
        }
    }
}
