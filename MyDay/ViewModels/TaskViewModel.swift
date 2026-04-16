//
//  TaskViewModel.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation
                
@Observable
class TaskViewModel {
    private var modelContext: ModelContext

    init(context: ModelContext) {
        self.modelContext = context
    }
 
    func toggleComplete(_ task: Task) {
        task.isCompleted.toggle()
        task.completedAt = task.isCompleted ? Date() : nil
    }

    func delete(_ task: Task) {
        self.modelContext.delete(task)
    }

    func addTask(title: String, notes: String?, priority: TaskPriority, dueDate:
Date?) {
        let task = Task()
        task.title = title
        task.notes = notes
        task.priority = priority
        task.dueDate = dueDate
        
        modelContext.insert(task)
    }
}
