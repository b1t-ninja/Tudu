//
//  Headline.swift
//  Tudu
//
//

import SwiftUI

struct Headline: View {
    var text: String = "Tudu!"
    var addTodo: ((Todo) -> Void)? = nil
    var toggleModal: (() -> Void)? = nil
    var body: some View {
        HStack(spacing: 16) {
            Text(text)
                .foregroundStyle(Color.todoWhite)
                .font(.custom("Sharpie-Bold", size: 45))
            
            Spacer()
            
            Button {
                toggleModal?()
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.todoLightGreen)
                    .font(.title)
                    .padding(20)
                    .background(.blue.opacity(0.001))
                    .offset(x: 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.todoBlack.ignoresSafeArea()
        Headline()
    }
}
