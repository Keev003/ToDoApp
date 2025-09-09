//
//  TodoDetailView.swift
//  ToDoApp
//
//  Created by Kevin Evensen on 09/09/2025.
//

import SwiftUI

struct TodoDetailView: View {
    
    init(todoItem: String){
        self.todoItem = todoItem
    }
    
    var todoItem: String
    @State var isShowingSheet: Bool = false
    
    func didTapQuestionMark(){
        isShowingSheet.toggle() // .toggle vil endre en bool fra true til false og omvendt
        // isShowingSheet = true
    }
    
    var body: some View {
        VStack{
            Text(todoItem)
            Button {
                // her kommer en funksjon for å få opp en sheet.
                didTapQuestionMark()
            } label: {
                Image(systemName: "questionmark")
            }

        }
        .padding()
        .sheet(isPresented: $isShowingSheet) {
            // her skal vi ha en ny skjerm, i dette tilfelle en hjelp meg skjerm
            TodoHelpView(todoItem: todoItem)
        }
    }
}

#Preview {
    TodoDetailView(todoItem: "Test todo item")
}
