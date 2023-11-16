

//  PushNotificationCloudKit.swift
//  AppChat
//
//  Created by Jairo Júnior on 07/11/23.

// Import necessary frameworks
import SwiftUI
import CloudKit

// Define a class for handling CloudKit push notifications
class PushNotificationCloudKit: ObservableObject {

    // Initialize the class
    init() {
        // Request permission for notifications and subscribe to notifications when the class is initialized
        requestNotificationPermission()
        subscribeToNotifications()
    }

    // Request permission for user notifications
    func requestNotificationPermission() {
        // Specify the types of notifications the app wants to use
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        // Request authorization for the specified notification types
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                // Handle any errors that occur during the authorization process
                print(error)
            } else if success {
                // If authorization is successful, print a success message and register for remote notifications
                print("Notifications permissions success")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                // Handle the case where authorization is not successful
                print("Notifications permissions failure")
            }
        }
    }

    // Subscribe to CloudKit notifications for a specific record type (in this case, "Messages")
    func subscribeToNotifications() {
        // Create a predicate for the subscription (TRUEPREDICATE subscribes to all records of the specified type)
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        
        // Create a query subscription with the specified predicate, subscription ID, and options
        let subscription = CKQuerySubscription(
            recordType: "Messages",
            predicate: predicate,
            subscriptionID: "message_added_to_database",
            options: .firesOnRecordCreation
        )

        // Configure notification details
        let notification = CKSubscription.NotificationInfo()
        notification.title = "New skin at store"
        notification.alertLocalizationKey = "%1$@"
        notification.alertLocalizationArgs = ["text"]
        notification.soundName = "default"

        // Set the notification details for the subscription
        subscription.notificationInfo = notification

        // Save the subscription to the public CloudKit database
        CKContainer.default().publicCloudDatabase.save(subscription) { returnedSubscription, error in
            if let error = error {
                // Handle any errors that occur during the subscription process
                print("Error subscribing to notifications: \(error)")
            } else {
                // Print a success message if the subscription is successful
                print("Successfully subscribed to notifications")
            }
        }
    }

    // Unsubscribe from CloudKit notifications
    func unSubscribeToNotifications() {
        // Delete the subscription with the specified subscription ID from the public CloudKit database
        CKContainer.default().publicCloudDatabase.delete(withSubscriptionID: "message_added_to_database") { id, error in
            if let error = error {
                // Handle any errors that occur during the unsubscription process
                print(error)
            } else {
                // Print a success message if the unsubscription is successful
                print("Successfully unsubscribed")
            }
        }
    }
}
