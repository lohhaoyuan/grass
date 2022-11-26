//
////  Notifications.swift
////  grass
//
////  Created by T Krobot on 24/11/22.
//
//import Foundation
//import UserNotifications
//
//var Waternotifications {
//    let content = UNMutableNotificationContent()
//    content.title = "Water your plant"
//    content.subtitle = "It is thirsy"
//    content.sound = UNNotificationSound.default
//
//    // show this notification five seconds from now
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//    // choose a random identifier
//    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//    // add our notification request
//    UNUserNotificationCenter.current().add(request)
//
//}
