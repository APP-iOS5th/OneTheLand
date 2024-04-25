//
//  ContentView.swift
//  TodoList
//
//  Created by 황승혜 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [Task]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    let task = tasks[index]
                    HStack {
                        Button(action: {
                            // check!
                            withAnimation {
                                tasks[index].completed.toggle()
                            }
                        }) {
                            if task.completed {
                                Image(systemName: "checkmark.circle.fill")
                            } else {
                                Image(systemName: "circle")
                            }
                        }
                        Text(task.description)
                            .font(.title3)
                    }
                }
                .padding()
            }
            .navigationTitle("To Do List")
//            .toolbar {
//                Button("Add") {
//                    //addItemToRow()
//                }
//            }
            
        }
    }
}

#Preview {
    ContentView(tasks: Task.tasks)
}
