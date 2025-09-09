//
//  ContentView.swift
//  ToDoApp
//
//  Created by Kevin Evensen on 09/09/2025.
//

import SwiftUI

struct TodoListView: View {
    @State private var todoItems: [TodoItem] = [
        TodoItem(text: "Lære Swift", helpText: "Ta kurset PG5602"),
        TodoItem(text: "Publisere appen på app store", helpText: "Gå til appstoreconnect.com og lag konto"),
        TodoItem(text: "Profil", helpText: "")
    ]
    @State private var todos = ["Lære swift", "Publisere appen på app store", "Profil"]
    @State private var newTodoText: String = ""
    
    func addTodo(){
        if newTodoText.isEmpty == false {
            todos.append(newTodoText)
            newTodoText = ""
        }
    }
    
    func deleteTodo(offset: IndexSet){
        print("todos before \(todos)")
        todos.remove(atOffsets: offset)
        print("todos after \(todos)")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Add todo", text: $newTodoText)
                Button {
                    // legg til en action (funksjon for hva som skjer når man trykker på knappen.
                    addTodo()
                } label: {
                    Text("Legg til")
                }

                List{
                    ForEach(todos, id: \.self) {todo in
                        NavigationLink{
                            TodoDetailView(todoItem: todo) // destination/nytt view.
                            /* Alternativ løsning, men ikke gjør dette ettersom at det kan være ugunstig dersom det er flere som skal kode i denne koden. Ettersom at det ikke er godt definert.
                             let todoDetail = TodoDetailView()
                             todoDetail.todoItem = todo
                             */
                            
                        } label: {
                            Label(todo, systemImage: "pencil")
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
            }
            .padding()
            .navigationTitle("Oppgaver \(todos.count)")
        }

    }
}

#Preview {
    TodoListView()
}
