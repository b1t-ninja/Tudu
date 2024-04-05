//
//  TuduApp.swift
//  Tudu
//
//

import SwiftUI
import SwiftData

@main
struct TuduApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Todo.self])
        }
    }
}
