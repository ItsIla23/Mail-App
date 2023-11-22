//
//  ContentView.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//

import SwiftUI

struct MailboxesView: View {
    
    @State private var showModalAdd: Bool = false
    
    var body: some View {
        
        @State var showModalAdd: Bool = false
        
        
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: InboxesView(searchQuery: "Search")) {
                        HStack {
                            Image(systemName: "tray.2").foregroundColor(.blue)
                            Text("All Inboxes")
                        }
                    }
                    HStack {
                        Image(systemName: "tray").foregroundColor(.blue)
                        Text("iCloud")
                    }
                    HStack {
                        Image(systemName: "tray").foregroundColor(.blue)
                        Text("Gmail")
                    }
                    HStack {
                        Image(systemName: "star").foregroundColor(.yellow)
                        Text("VIP")
                    }
                }
                .navigationBarTitle("Mailboxes")
                
                
                Section (header: Text("iCloud").bold().foregroundColor(.black).font(.title2).textCase(nil)) {
                    NavigationLink(destination: InboxesView(searchQuery: "Search")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("Inbox")
                        }
                    }
                    HStack {
                        Image(systemName: "doc").foregroundColor(.blue)
                        Text("Drafts")
                    }
                    HStack {
                        Image(systemName: "paperplane").foregroundColor(.blue)
                        Text("Sent")
                    }
                    HStack {
                        Image(systemName: "xmark.bin").foregroundColor(.blue)
                        Text("Junk")
                    }
                }
                
                Section (header: Text("Gmail").bold().foregroundColor(.black).font(.title2).textCase(nil)) {
                    NavigationLink(destination: InboxesView(searchQuery: "Search")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("Inbox")
                        }
                    }
                    HStack {
                        Image(systemName: "doc").foregroundColor(.blue)
                        Text("Drafts")
                    }
                    HStack {
                        Image(systemName: "paperplane").foregroundColor(.blue)
                        Text("Sent")
                    }
                    HStack {
                        Image(systemName: "xmark.bin").foregroundColor(.blue)
                        Text("Junk")
                    }
                }
            }  .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    
                    Button (action: {
                        self.showModalAdd = true
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .offset(x: 160)
                        
                    }).sheet(isPresented: self.$showModalAdd){
                        NewMessageModal();
                    }
                }
            }
        } .navigationViewStyle(.stack)
        
    }
    
}


#Preview {
    MailboxesView()
}
