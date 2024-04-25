//
//  ContentView.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query() var tasks: [Task] = Task.tasks
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    @State var selectedPriority = task.priority
                    
                    HStack {
                        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                completeTask(task)
                            }
                        NavigationLink(destination: TaskView(task: task)) {
                            Text("\(task.taskDescription)")
                        }
                    }
                    .font(.system(size: 20))
                    .padding()
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("To do List")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink {
                        AddTaskView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func deleteTask(offsets: IndexSet) {
        withAnimation {
            for offset in offsets {
                let task = tasks[offset]
                
                modelContext.delete(task)
            }
        }
    }
    
    func completeTask(_ task: Task) {
        task.completed.toggle()
    }
}

#Preview {
    ContentView()
}
