//
//  PhilanthrofeedApp.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 3/30/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = Nil) -> Bool {
        
        return true
    }
}

@main


struct PhilanthrofeedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
