//
//  AppContainer.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import SwiftData

// init data
@MainActor
let appContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Task.self)
        
        var taskFetchDescriptor = FetchDescriptor<Task>()
        taskFetchDescriptor.fetchLimit = 1
        
        guard try container.mainContext.fetch(taskFetchDescriptor).count == 0 else { return container }
        
        for task in Task.tasks {
            container.mainContext.insert(task)
        }
        
        return container
    } catch {
        fatalError("")
    }
}()

