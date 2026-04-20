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
    let sharedModelContainer: ModelContainer
    let taskViewModel: TaskViewModel
                                                                                                                                           
    init() {
        let schema = Schema([Category.self, Task.self, Transaction.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: schema, configurations: [config])
        self.sharedModelContainer = container
        self.taskViewModel = TaskViewModel(context: container.mainContext)
    }
 
    var body: some Scene {
        WindowGroup {
            TodayView()
                .environment(taskViewModel)  // ← кладём в окружение
        }
        .modelContainer(sharedModelContainer)
    }
}
