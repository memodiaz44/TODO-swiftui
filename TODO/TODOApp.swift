//
//  TODOApp.swift
//  TODO
//
//  Created by Adel Diaz on 29/09/23.
//

import SwiftUI
import FirebaseCore

@main
struct TODOApp: App {
    
    @UIApplicationDelegateAdaptor(ApoDelegate.self) var appDelegate 
    
    var body: some Scene {
        WindowGroup {
            let modelView = ModelViewApp()
            ContentView().environmentObject(modelView)
        }
    }
}

class ApoDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
