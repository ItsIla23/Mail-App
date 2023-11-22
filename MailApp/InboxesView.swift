//
//  MailboxesView.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//



import SwiftUI
import SwiftData

struct InboxesView: View {
    
    @State  var showModalAdd: Bool = false
    
    @State var searchQuery: String
    
    
    
    
    var body: some View {
        
        List {
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            VStack (alignment: .leading){
                Text("Aliexpress").bold()
                Text("I best hajk")
                Text("ghjk").foregroundColor(.gray)
            }
            
        }
        
        .navigationTitle("All Inboxes")
        .searchable(text: $searchQuery)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //inserisci come filtrare le mail
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                    
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    self.showModalAdd = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                }).sheet(isPresented: self.$showModalAdd){
                    NewMessageModal();
                }
            }
            
            
        }
        
        
        
        
        
        
    }
    
}

#Preview {
    InboxesView(searchQuery: "")
}
