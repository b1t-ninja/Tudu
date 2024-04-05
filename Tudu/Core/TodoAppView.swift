//
//  TodoAppView.swift
//  Tudu
//
//

import SwiftUI
import SwiftData


// TODO! create addNewTodo modal and make it visible via the + button in header
struct TodoAppView: View {
    @State private var showModal: Bool = false
    @Environment (\.modelContext) var modelContext
    @Query var todos: [Todo]
    var body: some View {
        ZStack {
            Color.todoBlack.ignoresSafeArea()
            VStack {
                Headline(addTodo: addTodo, toggleModal: toggleModal)
                TodosCell(todos: todos, deleteTodo: deletTodo)
            }
        }
        .sheet(isPresented: $showModal) {
            AddTodoModal(isSelected: $showModal, addTodo: addTodo)
        }
    }
    private func addTodo(todo: Todo) {
        modelContext.insert(todo)
    }
    
    private func deletTodo(todo: Todo) {
        withAnimation {
            modelContext.delete(todo)
        }
        }
    
    private func toggleModal() {
        showModal.toggle()
    }
}


#Preview {
    TodoAppView()
}
