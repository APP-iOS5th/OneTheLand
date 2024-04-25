//
//  Task.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import Foundation
import SwiftData

enum Priority: Comparable, CaseIterable, Codable {
    case low
    case medium
    case high
}

@Model
class Task: Identifiable {
    var id = UUID()
    var completed: Bool
    var taskDescription: String
    var priority: Priority
    
    init(completed: Bool, taskDescription: String, priority: Priority) {
        self.completed = completed
        self.taskDescription = taskDescription
        self.priority = priority
    }
}

extension Task {
    static var tasks = [
        Task(completed: false, taskDescription: "Wake up", priority: .low ),
        Task(completed: false, taskDescription: "Shower", priority: .medium),
        Task(completed: false, taskDescription: "Code", priority: .high),
        Task(completed: false, taskDescription: "Eat", priority: .high ),
        Task(completed: false, taskDescription: "Sleep", priority: .high),
        Task(completed: false, taskDescription: "Get groceries", priority: .high)
    ]
    static var task = tasks[0]
}
