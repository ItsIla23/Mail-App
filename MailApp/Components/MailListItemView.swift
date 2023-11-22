//
//  MailListItemView.swift
//  MailApp
//
//  Created by Ilaria Poziello on 22/11/23.
//

import Foundation
import SwiftUI

struct MailListItemView: View {
    
    var emailModel: Mail
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text(emailModel.title).bold()
                Spacer()
                Text("Yesterday").foregroundColor(.gray)
                Image(systemName: "greaterthan").foregroundColor(.gray)
            }
            Text(emailModel.subtitle)
            Text(emailModel.text).foregroundColor(.gray)
        }
    }
    
    
}
