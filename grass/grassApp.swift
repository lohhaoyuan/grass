//
//  grassApp.swift
//  grass
//
//  Created by saumil on 22/10/22.
//

import SwiftUI

@main

struct grassApp: App {
    
    private var delegate: NotificationDelegate = NotificationDelegate()
    
    init() {
        let center = UNUserNotificationCenter.current()
        center.delegate = delegate
        center.requestAuthorization(options: [.alert, .sound, .badge]) { result, error in
            if let error = error {
                print(error)
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
