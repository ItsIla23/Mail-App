//
//  Item.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
