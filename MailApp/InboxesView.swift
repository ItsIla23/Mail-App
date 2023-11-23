//
//  MailboxesView.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//



import SwiftUI
import SwiftData

struct InboxesView: View {
    
    
    var viewTitle: String
    
    @Environment(\.modelContext) var modelContext
    
    @State var showModalAdd: Bool = false
    
    @State var searchQuery: String = " "
    
    var emails: [Mail] = [
        Mail(title: "Amazon Service", subtitle: "Your Recent Purchase Confirmation", text: "Dear [Name], thank you for your recent purchase on Amazon! We're delighted..."),
        Mail(title: "Facebook", subtitle: "New Friend Request on Facebook", text: "You have a new friend request on Facebook! Connect with friends, share..."),
        Mail(title: "Apple ID ", subtitle: "Your Recent Apple ID Sign-In", text: "We wanted to inform you of a recent sign-in to your Apple ID from a new dev..."),
        Mail(title: "Instagram Support", subtitle: "Important Security Update on Instagram", text: "Hello [Your Instagram Username], your account security is our top priority. We..."),
        Mail(title: "LinkedIn Connections", subtitle: "LinkedIn Connection Invitation", text: "Hi [Your Name], [Sender Name] has sent you a connection invitation on LinkedIn..."),
        Mail(title: "Twitter Notifications", subtitle: "You've Got New Followers on Twitter", text: "Hello [Your Twitter Handle], congratulations! You've gained new foll..."),
        Mail(title: "Microsoft Account Team", subtitle: "Microsoft Account Update", text: "Dear [Your Name], we wanted to inform you of an update to your Microsoft...")
    ]
    
    
    @Query
    var mail2: [Mail]
    
    var body: some View {
        
        List {
            if viewTitle == "Sent" {
                ForEach (mail2) { email in
                    MailListItemView(emailModel: email)
                }
            } else {
                ForEach(emails) { email in
                    MailListItemView(emailModel: email)
                }

            }
        }
        
        .navigationTitle(viewTitle)
        .searchable(text: $searchQuery)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    mail2.forEach{ mail in
                        modelContext.delete(mail)
                    }
                    try? modelContext.save()
                } label: {
                    Text("Delete")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button {
                    for mail in mail2 {
                        print(mail.id, mail.text)
                    }
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
    InboxesView(viewTitle: "")
}
