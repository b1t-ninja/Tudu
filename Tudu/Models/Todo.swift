//
//  Todo.swift
//  Tudu
//

import Foundation
import SwiftData

@Model
final class Todo {
    var id = UUID()
    var title: String
    var contents: String
    var created: Date
    
    init(title: String = "", contents: String = "") {
        self.title = title
        self.contents = contents
        self.created = Date.now
    }
}
