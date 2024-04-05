//
//  TodoInputModal.swift
//  Tudu
//
//  Created by Nico Rückner on 05.04.24.
//

import SwiftUI

struct TodoInputModal: View {
    @State private var input: String = "# title\n\ncontent"
    var body: some View {
        TextEditor(text: $input)
            .frame(maxWidth: .infinity, maxHeight: 500)
            .foregroundStyle(.white)
            .font(.custom("Satoshi-Medium", size: 23))
            .scrollContentBackground(.hidden)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            .onTapGesture {
                input = String()
            }
    }
}

#Preview {
    ZStack {
        Color.todoBlack.ignoresSafeArea()
        TodoInputModal()
    }
}
