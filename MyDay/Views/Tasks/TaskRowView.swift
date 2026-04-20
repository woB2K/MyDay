//
//  TaskRowView.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var onToggle: () -> Void = {}

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 2)
                .fill(task.priority.color)
                .frame(width: 5)

            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22))
                    .foregroundColor(task.isCompleted ? Color.appGreen : Color.appText3)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.system(.body, design: .rounded))
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? Color.appText2 : Color.appText)

                HStack(spacing: 8) {
                    if let dueDate = task.dueDate {
                        Label(dueDate.formatted(.dateTime.hour().minute()), systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(Color.appText2)
                    }
                    Text(task.priority.label)
                        .font(.caption)
                        .foregroundColor(task.priority.color)
                }
            }

            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.trailing, 16)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color.appSurface3)
                .frame(height: 2)
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    let task = Task()
    task.title = "Купить молоко"
    task.priority = .high
    task.isCompleted = false
    return TaskRowView(task: task)
        .background(Color.appBg)
}
