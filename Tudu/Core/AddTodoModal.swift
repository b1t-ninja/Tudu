//
//  AddTodoModal.swift
//  Tudu
//

import SwiftUI

struct Note {
    var title: String
    var contents: String
}

// TODO!
// Change the input for modal
struct AddTodoModal: View {
    @State private var contents = "# Title\nContents"
    @Binding var isSelected: Bool
    var addTodo: ((Todo) -> Void)? = nil
    var body: some View {
        ZStack {
            Color.todoBlack.ignoresSafeArea()
            VStack {
                Text("New Todo")
                    .font(.custom("Sharpie-Bold", size: 35))
                    .foregroundStyle(Color.todoWhite)
                
                TodoInputModal(input: $contents)
                
                HStack {
                    Button {
                        let values = getTitleAndContents(input: contents)
                        let todo = Todo(title: values.title, contents: values.contents)
                        if let method = addTodo {
                            method(todo)
                        }
                        contents = ""
                    } label: {
                        Label("add", systemImage: "plus")
                            .foregroundColor(Color.todoWhite)
                            .padding()
                            .background(Color.todoGreen)
                            .cornerRadius(20)
                            .font(.custom("Satoshi-Regular", size: 20))
                        
                    }
                    
                    Button {
                        isSelected.toggle()
                    } label: {
                        Label("clear", systemImage: "xmark")
                            .foregroundColor(Color.todoWhite)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                            .font(.custom("Satoshi-Regular", size: 20))
                    }
                }
            }
        }
    }
    private func getTitleAndContents(input: String) -> Note {
        let inputs = input.split(separator: "\n")
        let title = String(inputs.first!).replacingOccurrences(of: "#", with: "")
        return Note(title: title, contents: String(inputs.last!))
    }
}


