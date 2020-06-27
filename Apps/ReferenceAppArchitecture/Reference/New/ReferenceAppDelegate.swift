//
//  ReferenceAppDelegate.swift
//  Reference
//
//  Created by Stan Stadelman on 6/25/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SwiftUI
import SAPFoundation
import SAPCommon
import SAPFioriFlows

class ReferenceAppDelegate: NSObject, UIApplicationDelegate {
    
    @Environment(\.onboardingSessionManager) var onboardingSessionManager
    let logger = Logger.shared(named: "ReferenceAppDelegate")
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            try SAPcpmsLogUploader.attachToRootLogger()
//            try UsageBroker.shared.start()
        } catch {
            print(error)
        }
        
        Logger.root.logLevel = .warn
        
        onboardingSessionManager.open { [self] error in
            // setup notifications
            initializeRemoteNotification()
            ConnectivityReceiver.registerObserver(self)
        }
        
        return true
    }
    
    func applicationDidEnterBackground(_: UIApplication) {
        OnboardingSessionManager.shared.lock { error in
            print("error: \(error)")
        }
    }

    func applicationWillEnterForeground(_: UIApplication) {
        // Triggers to show the passcode screen
        OnboardingSessionManager.shared.unlock { error in
            guard let error = error else {
                return
            }
        }
    }

    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
        // Onboarding is only supported in portrait orientation
        switch OnboardingFlowController.presentationState {
        case .onboarding, .restoring:
            return .portrait
        default:
            return .allButUpsideDown
        }
    }
}
