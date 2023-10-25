//
//  NewRelicDemoApp.swift
//  NewRelicDemo
//
//  Created by Pavel Kochenda on 24/10/2023.
//

import SwiftUI
import NewRelic

@main
struct NewRelicDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupNewRelic()
        
        return true
    }

    private func setupNewRelic() {
        NRLogger.setLogLevels(NRLogLevelAudit.rawValue)

        NewRelic
            .start(
                withApplicationToken: "eu01xxcd1e296feb5e74806ca988e6534522cbed40-NRMA" // ,
//              andCollectorAddress: "collector-dev.tseries.ru",
//              andCrashCollectorAddress: "collector-dev.tseries.ru"
            )
    }
}
