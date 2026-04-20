//
//  Task.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Task {
    var uid: UUID = UUID()
    var createTime: Date = Date()
    var updateTime: Date = Date()
    var title: String = ""
    var notes: String? = nil
    var isCompleted: Bool = false
    var priority: TaskPriority = TaskPriority.low
    var dueDate: Date? = nil
    var reminderDate: Date? = nil
    
    @Relationship(deleteRule: .nullify, inverse: \TaskTag.tasks)
    var tags: [TaskTag] = []
    
    var completedAt: Date? = nil
    var isRecurring: Bool = false
    var recurrenceRule: String? = nil
    
    init() {}
}

enum TaskPriority: String, Codable, CaseIterable {
    case low, medium, high
}
