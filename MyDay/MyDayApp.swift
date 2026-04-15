//
//  MyDayApp.swift
//  MyDay
//
//  Created by Maxim Vershinin on 15.04.2026.
//

import SwiftUI
import SwiftData

@main
struct MyDayApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Category.self,
            Task.self,
            Transaction.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
        }
        .modelContainer(sharedModelContainer)
    }
}
