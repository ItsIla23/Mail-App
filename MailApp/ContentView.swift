//
//  ContentView.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//

import SwiftUI

struct MailboxesView: View {
    
    @State var showModalAdd: Bool = false
    
    var body: some View { //aggiusta nav link
        
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: InboxesView(viewTitle: "All Inboxes", searchQuery: "")) {
                        HStack {
                            Image(systemName: "tray.2").foregroundColor(.blue)
                            Text("All Inboxes")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "iCloud", searchQuery: "")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("iCloud")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Gmail", searchQuery: "")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("Gmail")
                        }
                    }
                    HStack {
                        Image(systemName: "star").foregroundColor(.yellow)
                        Text("VIP")
                    }
                } 

                .navigationBarTitle("Mailboxes")
                
                
                Section (header: Text("iCloud").bold().foregroundColor(.black).font(.title2).textCase(nil)) {
                    NavigationLink(destination: InboxesView(viewTitle: "iCloud", searchQuery: "Search")) {
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
                    NavigationLink(destination: InboxesView(viewTitle: "Gmail", searchQuery: "Search")) {
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
                    HStack {
                        Spacer()
                        Button (action: {
                            self.showModalAdd = true
                        }, label: {
                            Image(systemName: "square.and.pencil")
      
                        }).sheet(isPresented: self.$showModalAdd){
                            NewMessageModal();
                    }
                    }
                }
            }
        } .navigationViewStyle(.stack)
        
    }
    
}


#Preview {
    MailboxesView()
}
