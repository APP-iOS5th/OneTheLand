//
//  TaskView.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import SwiftUI

struct TaskView: View {
    @State var task: Task
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text(task.taskDescription)
                    Spacer()
                    Picker(selection: $task.priority, label: EmptyView()) {
                        ForEach(Priority.allCases, id: \.self) { value in
                            Text("\(value)")
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    TaskView()
//}
