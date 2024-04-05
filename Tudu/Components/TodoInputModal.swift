//
//  TodoInputModal.swift
//  Tudu
//
//

import SwiftUI

struct TodoInputModal: View {
    @Binding var input: String
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

