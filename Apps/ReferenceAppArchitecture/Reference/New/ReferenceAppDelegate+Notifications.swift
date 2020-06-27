//
//  ReferenceAppDelegate+Notifications.swift
//  Reference
//
//  Created by Stan Stadelman on 6/25/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI
import SAPFoundation

extension ReferenceAppDelegate: UNUserNotificationCenterDelegate {
    
    func initializeRemoteNotification() {
        // Registering for remote notifications
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
    }
    
    func uploadDeviceTokenForRemoteNotification(_ deviceToken: Data) {
        
        guard let onboardingSession = onboardingSessionManager.onboardingSession else { return }
        
        let parameters = SAPcpmsRemoteNotificationParameters(deviceType: "iOS")
        
        onboardingSession.registerDeviceToken(deviceToken: deviceToken, withParameters: parameters) { [self] error in
            if let error = error {
                logger.error("Register DeviceToken failed", error: error)
            } else {
                logger.info("Register DeviceToken succeeded")
            }
        }
    }
    
    // MARK: AppDelegate method implementations for remote notification handling

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.uploadDeviceTokenForRemoteNotification(deviceToken)
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        self.logger.error("Failed to register for Remote Notification", error: error)
    }

    // Called to let your app know which action was selected by the user for a given notification.
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.logger.info("App opened via user selecting notification: \(response.notification.request.content.body)")
        // Here is where you want to take action to handle the notification, maybe navigate the user to a given screen.
        completionHandler()
    }

    // Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        self.logger.info("Remote Notification arrived while app was in foreground: \(notification.request.content.body)")
        // Currently we are presenting the notification alert as the application were in the background.
        // If you have handled the notification and do not want to display an alert, call the completionHandler with empty options: completionHandler([])
        completionHandler([.banner, .sound])
    }
}
