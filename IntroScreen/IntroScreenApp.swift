//
//  IntroScreenApp.swift
//  IntroScreen
//
//  Created by Abdullah Karaboğa on 25.12.2022.
//

import SwiftUI

@main
struct IntroScreenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
