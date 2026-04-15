//
//  Task.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Task: Base {
    var title: String = ""
    var notes: String? = nil
    var isCompleted: Bool = false
    var priority: TaskPriority = TaskPriority.low
    var dueDate: Date? = nil
    var reminderDate: Date? = nil
    var tags: [String] = []
    var completedAt: Date? = nil
    var isRecurring: Bool = false
    var recurrenceRule: String? = nil
    
    override init() {}
}

enum TaskPriority: String, Codable, CaseIterable {
    case low, medium, high
}
