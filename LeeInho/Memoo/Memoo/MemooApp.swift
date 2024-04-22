//
//  MemooApp.swift
//  Memoo
//
//  Created by 이인호 on 4/22/24.
//

import SwiftUI

@main
struct MemooApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Memo.self)
    }
}
