//
//  PhilanthrofeedApp.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 3/30/22.
//

import SwiftUI
import Parse

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "I5VfdZiRmUnKJalpxG4hHXZhIB4oPIL9lJ6nkxzf" // <- UPDATE
                $0.clientKey = "sauoLF1RtAG8FSDol0hB8X2eqflEfjy3uAT7bzAx" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
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
