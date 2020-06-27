//
//  ReferenceApp.swift
//  Reference
//
//  Created by Stan Stadelman on 6/24/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import SwiftUI
import SAPFiori
import SAPFioriFlows
import SAPOData

//class ModelCache: ObservableObject {
//    @Published var cache: [String: [EntityValue]] {
//        obje
//    }
//}

@main
struct ReferenceApp: App {
    @UIApplicationDelegateAdaptor(ReferenceAppDelegate.self) private var appDelegate
    @ObservedObject private var uiLifecycleManager = AppUILifecycleManager.shared
    @ObservedObject private var odataController = OfflineODataController.shared
    
    @SceneBuilder
    var body: some Scene {
        
        WindowGroup {
            switch uiLifecycleManager.screen {
                case .app:
                    ESPMViewer()
                case .onboarding:
                    if odataController.steps.isEmpty {
                        SplashScreen()
                    } else {
                        ODataProgressViewContainer(steps: OfflineODataController.shared.steps)
                    }
                case .screenshot:
                    Text("Capture screenshot for background")
            }
        }
    }
}


struct ESPMViewer: View {
    var body: some View {
        NavigationView {
            Text("Hello, World")
        }
    }
}

struct SplashScreen: View {
    
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            ProgressView<Text>(value: 0.3, total: 1.0, label: {
                Text(message)
            })
            .frame(maxWidth: 417)
        }
    }
}

