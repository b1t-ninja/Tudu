//
//  TodosCell.swift
//  Tudu
//

import SwiftUI
import SwiftData

struct TodosCell: View {
    var todos: [Todo] = []
    var deleteTodo: ((Todo) -> Void)? = nil
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(todos) {todo in
                    TodoCell(deleteTodo: deleteTodo, todo: todo)
                        .padding(4)
                }
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.todoBlack.ignoresSafeArea()
        TodosCell()
    }
}
