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
                            Text("All Inboxes").accessibilitySortPriority(2)
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
                    NavigationLink(destination: InboxesView(viewTitle: "VIP", searchQuery: "")) {
                        HStack {
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                            Text("VIP")
                        }
                    }
                }

                .navigationBarTitle("Mailboxes").accessibilitySortPriority(1)
                
                
                Section (header: Text("iCloud").bold().foregroundColor(.black).font(.title2).textCase(nil)) {
                    NavigationLink(destination: InboxesView(viewTitle: "iCloud", searchQuery: "Search")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("Inbox")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Drafts", searchQuery: "")) {
                        HStack {
                            Image(systemName: "doc").foregroundColor(.blue)
                            Text("Drafts")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Sent", searchQuery: "")) {
                        HStack {
                            Image(systemName: "paperplane").foregroundColor(.blue)
                            Text("Sent")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Junk", searchQuery: "")) {
                        HStack {
                            Image(systemName: "xmark.bin").foregroundColor(.blue)
                            Text("Junk")
                        }
                    }
                }
                
                Section (header: Text("Gmail").bold().foregroundColor(.black).font(.title2).textCase(nil)) {
                    NavigationLink(destination: InboxesView(viewTitle: "Gmail", searchQuery: "Search")) {
                        HStack {
                            Image(systemName: "tray").foregroundColor(.blue)
                            Text("Inbox")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Drafts", searchQuery: "")) {
                        HStack {
                            Image(systemName: "doc").foregroundColor(.blue)
                            Text("Drafts")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Sent", searchQuery: "")) {
                        HStack {
                            Image(systemName: "paperplane").foregroundColor(.blue)
                            Text("Sent")
                        }
                    }
                    NavigationLink(destination: InboxesView(viewTitle: "Junk", searchQuery: "")) {
                        HStack {
                            Image(systemName: "xmark.bin").foregroundColor(.blue)
                            Text("Junk")
                        }
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
