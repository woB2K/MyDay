//
//  TodayView.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftUI
import _SwiftData_SwiftUI

struct TodayView: View {
    @Environment(TaskViewModel.self) private var viewModel
    @Query private var tasks: [Task]
    var body: some View {
            VStack(alignment: .leading) {
                Text("Today is a good day")
                    .foregroundStyle(Color.appText)
                    .padding(.horizontal)
                List() {
                    ForEach(tasks, id: \.self) { item in
                        TaskRowView(task: item, onToggle: { viewModel.toggleComplete(item) })
                            .listRowBackground(Color.appBg)
                            .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    viewModel.delete(item)
                                } label: {
                                    Label("Удалить", systemImage: "trash")
                                }
                            }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.appBg)
                .listStyle(.plain)
                    
            }
            .background(Color.appBg)
        }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Task.self,
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

    return TodayView()
        .modelContainer(container)
        .environment(TaskViewModel(context: container.mainContext))
}
