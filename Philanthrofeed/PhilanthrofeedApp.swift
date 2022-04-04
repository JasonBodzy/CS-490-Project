//
//  PhilanthrofeedApp.swift
//  Philanthrofeed
//
//  Created by Jason Bodzy on 3/30/22.
//

import SwiftUI
import Parse

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = Nil) -> Bool {
        
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = "I5VfdZiRmUnKJalpxG4hHXZhIB4oPIL9lJ6nkxzf"
            $0.clientKey = "sauoLF1RtAG8FSDol0hB8X2eqflEfjy3uAT7bzAx"
            $0.server = "https.parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        return true
    }
}

@main


struct PhilanthrofeedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
main
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
