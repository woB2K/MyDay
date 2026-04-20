//
//  AddTaskSheets.swift
//  MyDay
//
//  Created by Maxim Vershinin on 20.04.2026.
//

import SwiftUI
import SwiftData

struct AddTaskSheet: View {
    @State var title: String = ""
    @State var notes: String = ""
    @State var priority: TaskPriority = TaskPriority.low
    @State var dueDate: Date = Date()
    
    @Query var allTags: [TaskTag]
    @State var selectedTag: [TaskTag] = []
    
    @Environment(\.dismiss) var dismiss
    @Environment(TaskViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            Text("Новая задача")
                .font(Font.custom("DMSerifDisplay-Regular",
                                  size: 28))
                .foregroundStyle(Color.appText)
            
            TextField("Что нужно сделать?", text: $title)
                .inputField()
                .padding(.horizontal, 16)
            
            TextField("Заметки/подробности", text: $notes)
                .inputField()
                .padding(.horizontal, 16)
            
            HStack {
                ForEach(TaskPriority.allCases, id: \.self) { p in
                    VStack {
                        Circle()
                            .foregroundStyle(p.color)
                            .frame(width: 10)
                        Text(p.label)
                            .foregroundStyle(p.color)
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(p == priority ? p.color : Color.clear)
                    )
                    .background(Color.appSurface)
                    .cornerRadius(16)
                    .onTapGesture {
                        priority = p
                    }
                }
            }
            
            DatePicker("Число", selection: $dueDate, displayedComponents: .date)
                .datePickerStyle(.compact)
                .inputField()
                .padding(16)
            
            Button("Создать задачу") {
                viewModel.addTask(title: title, notes: notes.isEmpty ? nil : notes, priority: priority, dueDate: dueDate)
                dismiss()
            }
            .primaryButton()
            .padding(16)
        }
        .background(Color.appBg)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Task.self, TaskTag.self,
configurations: config)

    let task1 = Task()
    task1.title = "Купить молоко"
    task1.priority = .high
 
    let task2 = Task()
    task2.title = "Сделать зарядку"
    task2.priority = .medium
    task2.isCompleted = true
 
    container.mainContext.insert(task1)
    container.mainContext.insert(task2)

    return AddTaskSheet()
        .modelContainer(container)
        .environment(TaskViewModel(context: container.mainContext))
}
