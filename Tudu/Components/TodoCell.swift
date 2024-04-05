//
//  TodoCell.swift
//  Tudu
//
//

import SwiftUI

struct TodoCell: View {
    @State private var buttonPressed: Bool = false
    var title: String = "some title"
    var content: String = "walk the bugchild"
    var deleteTodo: ((Todo) -> Void)? = nil
    var todo: Todo? = nil
    @State private var count = 0
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: buttonPressed ? "xmark.circle.fill" : "circle")
                .foregroundStyle(Color.todoGreen)
                .font(.title2)
                .onTapGesture {
                    if deleteTodo != nil {
                        withAnimation {
                            buttonPressed.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // delay needed otherwise animation won't show, code toooo blazing
                                    if let deleteTodo = deleteTodo {
                                        deleteTodo(todo!)
                                    }
                                }
                    } else {
                        withAnimation {
                            buttonPressed.toggle()
                        }
                    }
                }
            VStack(alignment: .leading) {
                Text(todo?.title ?? "Title")
                    .font(.custom("Satoshi-Medium", size: 23))
                    .foregroundStyle(Color.todoWhite)
                
                Text(todo?.contents ?? "Contents")
                    .font(.custom("Satoshi-Regular", size: 20))
                    .foregroundStyle(Color.todoWhite)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, topTrailing: 30)))
    }
}

#Preview {
    ZStack {
        Color.todoBlack.ignoresSafeArea()
        TodoCell()
    }
}
