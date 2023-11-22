//
//  MailModel.swift
//  MailApp
//
//  Created by Ilaria Poziello on 21/11/23.
//

import Foundation
import SwiftData

@Model
class Mail: Identifiable {
    var id: UUID = UUID()
    var title: String
    var subtitle: String
    var text: String
    
    init(title: String, subtitle: String, text: String) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
    }
}
