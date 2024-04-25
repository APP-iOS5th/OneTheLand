//
//  ContentView.swift
//  TodoList
//
//  Created by 황승혜 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    var tasks: [Task]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: "circle")
                        Text(task.description)
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
