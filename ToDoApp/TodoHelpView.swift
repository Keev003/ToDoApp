//
//  TodoHelpView.swift
//  ToDoApp
//
//  Created by Kevin Evensen on 09/09/2025.
//

import SwiftUI

struct TodoHelpView: View {
    
    var todoItem: String // konstruktør?
    
    var body: some View {
        Text("Todo help text: ")
            .font(.callout)
        Text(todoItem)
    }
}

#Preview {
    TodoHelpView(todoItem: "test preview todo item")
}
