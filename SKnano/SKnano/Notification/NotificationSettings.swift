import Foundation
import UserNotifications
import SwiftUI

//struct NotificationSettings {
//    func requestNotificationPermission() {
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
//            if let error = error {
//                print(error)
//            } else if success {
//                print("Notifications permissions success")
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//            } else {
//                print("Notifications permissions failure")
//            }
//        }
//    }
//
//    func scheduleNotification() {
//        let center = UNUserNotificationCenter.current()
//        center.getNotificationSettings { settings in
//            guard (settings.authorizationStatus == .authorized) ||
//                  (settings.authorizationStatus == .provisional) else { return }
//
//            if settings.alertSetting == .enabled {
//                // Schedule an alert-only notification.
//            } else {
//                // Schedule a notification with a badge and sound.
//            }
//        }
//    }
//}
//
//extension NotificationSettings {
//    func registerForRemoteNotifications() {
//        let application = UIApplication.shared
//
//        application.registerForRemoteNotifications()
//    }
//}
//
//class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        
//        UIApplication.shared.registerForRemoteNotifications()
//        return true
//    }
//    
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("Error to register for temote notification with error: \(error)")
//    }
//    
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        print(deviceToken.hexString)
//    }
//}
//
//extension Data {
//    var hexString: String {
//        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
//        return hexString
//    }
//}
//
//
//struct NotificationSettings{
//    func triggerNotification(_ content: UNMutableNotificationContent) {
//        
//        let uuid = UUID().uuidString
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(0), repeats: false)
//        
//        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
//        
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.add(request) { (error) in
//            
//            if error == nil {
//                print("Foi")
//            } else {
//                print(error)
//            }
//            
//        }
//        
//    }
//    
//    func getNotificationContent() -> UNMutableNotificationContent {
//        let content = UNMutableNotificationContent()
//        
//        content.title = "Renove a assinatura"
//        content.body = "Funcinou acho"
//        content.badge = 25
//        
//        return content
//    }
//}
