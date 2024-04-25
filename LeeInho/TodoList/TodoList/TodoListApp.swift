//
//  TodoListApp.swift
//  TodoList
//
//  Created by 이인호 on 4/25/24.
//

import SwiftUI

@main
@MainActor
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(appContainer)
    }
}
