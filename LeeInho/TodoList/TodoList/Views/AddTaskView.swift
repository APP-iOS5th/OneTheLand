//
//  AddTaskView.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import SwiftUI

struct AddTaskView: View {
    @State var taskText: String = ""
    @State var priority: Priority = .low
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        TextField("What to do", text: $taskText)
                            .padding()
                        Spacer()
                        Picker(selection: $priority, label: EmptyView()) {
                            ForEach(Priority.allCases, id: \.self) { value in
                                Text("\(value)")
                            }
                        }
                    }
                }
            }
            .navigationTitle("New task")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        addTask(text: taskText)
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                    .disabled(taskText.isEmpty)
                }
            }
        }
    }
    
    func addTask(text: String) {
        let newTask = Task(completed: false, taskDescription: taskText, priority: priority)
        modelContext.insert(newTask)
    }
}

#Preview {
    AddTaskView()
}
