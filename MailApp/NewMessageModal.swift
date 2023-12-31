//
//  NewMessageModal.swift
//  MailApp
//
//  Created by Ilaria Poziello on 21/11/23.
//

import SwiftUI

struct NewMessageModal: View {
    
    @State var toText: String = ""
    @State var cc: String = ""
    @State var subject: String = ""
    @State var mailText: String = ""
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
       
        VStack {
            Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Cancel")
                } .offset(x:-160)
            Spacer()
                .frame(height: 20)
            
            HStack {
                Text("New Message").accessibilitySortPriority(1)
                    .bold().font(.largeTitle)
                
                    Spacer()
                    .frame(width: 115)
                Button(action: {
                    modelContext.insert(Mail(title: toText, subtitle: subject, text: mailText))
                    try? modelContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.gray)
                        .accessibilityLabel("Send mail")
                })
            }
            
            HStack {
                Text("To:").foregroundColor(.gray)
                TextField("", text: $toText)
                    .accessibilityLabel("To")
            } .padding(.horizontal, 10)
            
            Divider()
                .padding(.horizontal, 10)
                .frame(height: 5)
            HStack {
                Text("Cc/Bcc, From:").foregroundColor(.gray)
                TextField("", text: $cc)
                    .accessibilityLabel("From")
            } .padding(.horizontal, 10)
            Divider()
                .frame(height: 5)
                .padding(.horizontal, 20)
            HStack {
                Text("Subject:").foregroundColor(.gray)
                TextField("", text: $subject)
                    .accessibilityLabel("Subject")
                
                Image(systemName: "bell").foregroundColor(.blue)
            } .padding(.horizontal, 10)
            
            Divider()
                .frame(height: 5)
                .padding(.horizontal, 20)
            
            TextField("", text: $mailText)
                .accessibilityLabel("Message body")
                .padding(.horizontal, 8)
            
            
        }
        .offset(x: 0, y: -220)
        
            
            
        
            
      
        
    }
}

#Preview {
    NewMessageModal(toText: "")
}
