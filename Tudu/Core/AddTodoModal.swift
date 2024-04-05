//
//  AddTodoModal.swift
//  Tudu
//

import SwiftUI

struct AddTodoModal: View {
    @State private var title = String()
    @State private var contents = String()
    @Binding var isSelected: Bool
    var addTodo: ((Todo) -> Void)? = nil
    var body: some View {
        ZStack {
            Color.todoBlack.ignoresSafeArea()
            VStack {
                Text("Todo")
                    .font(.custom("Sharpie-Bold", size: 30))
                    .foregroundStyle(Color.todoWhite)
                
                Section {
                    TextField("", text: $title, prompt: Text("title...").foregroundStyle(.white).font(.custom("Satoshi-Regular", size: 20)))
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding()
                        .foregroundStyle(Color.todoWhite)
                }
                
                Section {
                    TextField("", text: $contents, prompt: Text("contents...").foregroundStyle(.white).font(.custom("Satoshi-Regular", size: 20)))
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .padding()
                        .foregroundStyle(Color.todoWhite)
                }
                
                HStack {
                    Button {
                        let todo = Todo(title: title, contents: contents)
                        if let method = addTodo {
                            method(todo)
                        }
                        title = ""
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
}


