//
//  PushNotificationCloudKit.swift
//  AppChat
//
//  Created by Jairo Júnior on 07/11/23.
//

import SwiftUI
import CloudKit

class PushNotificationCloudKit: ObservableObject{
    
    func requestNotificationPermission(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { sucess, error in
            
            if let error = error{
                print(error)
            }else if sucess{
                print("Notifications permissions success")
                
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }else{
                print("Notifications permissions failure")
            }
        }
    }
    
    func subscribeToNotifications() {
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        let subscription = CKQuerySubscription(recordType: "Messages", predicate: predicate, subscriptionID: "message_added_to_database", options: .firesOnRecordCreation)


        let notification = CKSubscription.NotificationInfo()
        notification.title = "New skin at store"
        notification.alertLocalizationKey = "%1$@"
        notification.alertLocalizationArgs = ["text"]
        notification.soundName = "default"

        subscription.notificationInfo = notification

        CKContainer.default().publicCloudDatabase.save(subscription) { returnedSubscription, error in
            if let error = error {
                print("Error subscribing to notifications: \(error)")
            } else {
                print("Successfully subscribed to notifications")
            }
        }
    }
    func unSubscribeToNotifications(){
        
        CKContainer.default().publicCloudDatabase.delete(withSubscriptionID: "message_added_to_database") { id, error in
            if let error = error{
                print(error)
            }else{
                print("successfully unsubscribed")
            }
        }
    }
}
