//
//  TodoDetailView.swift
//  Tudu
//
//

import SwiftUI

// TODO! Create detail view for Todo
struct TodoDetailView: View {
    var todo: Todo
    var body: some View {
        ZStack {
            Color.todoBlack.ignoresSafeArea()
            VStack(spacing: 16) {
                Text(todo.title)
                    .font(.custom("Sharpie-Bold", size: 35))
                    .foregroundStyle(Color.todoWhite)
                Text(todo.contents)
                    .font(.custom("Satoshi-Regular", size: 25))
                    .foregroundStyle(Color.todoWhite)
                Text("\(todo.created.formatted())")
                    .foregroundStyle(Color.todoWhite)
                    .font(.custom("Satoshi-Regular", size: 20))
            }
        }
    }
}
