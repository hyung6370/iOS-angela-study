//
//  AppDelegate.swift
//  ios-push-ex
//
//  Created by KIM Hyung Jun on 10/27/23.
//

import UIKit
import UserNotifications
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        registerForPushNotification()
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func registerForPushNotification() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                print("Permission granted: \(granted)")
                
                guard granted else { return }
                self.getNotificationSettings()
            }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
    func receivePushNotiNews(title: String, body: String, linkURL: String) {
        let newsText = "\(title) : \(body) (\(linkURL)) : \(Date())"
        var newsList = UserDefaults.standard.array(forKey: "NewsList") ?? [String]()
        newsList.append(newsText)
        UserDefaults.standard.set(newsList, forKey: "NewsList")
    }

}

extension Notification.Name {
    static let refreshTextView = Notification.Name("RefreshTextView")
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Case 1: 앱이 열린 상태일 때
        let content = notification.request.content
        receivePushNotiNews(title: "[Case 1] " + content.title, body: content.body, linkURL: content.userInfo["link_url"] as! String)
        NotificationCenter.default.post(name: .refreshTextView, object: nil)
        
        // 앱이 열린 상태에서도 푸시 알림을 표시하고 싶으면 아래 코멘트 해제
        // completionHandler([.banner, .badge, .sound])
    }
    
    // ... //
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Case 2: 앱이 백그라운드(background) 모드이거나 완전히 닫혔을 때(killed or terminated) 되었을 때
        let content = response.notification.request.content
        receivePushNotiNews(title: "[Case 2] " + content.title, body: content.body, linkURL: content.userInfo["link_url"] as! String)
        NotificationCenter.default.post(name: .refreshTextView, object: nil)
        
        completionHandler()
    }
}
