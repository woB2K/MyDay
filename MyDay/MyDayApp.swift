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
    let financeViewModel: FinanceViewModel
                                                                                                                                           
    init() {
        let schema = Schema([Category.self, Task.self, Transaction.self, TaskTag.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: schema, configurations: [config])
        self.sharedModelContainer = container
        self.taskViewModel = TaskViewModel(context: container.mainContext)
        self.financeViewModel = FinanceViewModel(context: container.mainContext)
    }
 
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(taskViewModel)
                .environment(financeViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
