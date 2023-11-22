//
//  MailAppApp.swift
//  MailApp
//
//  Created by Ilaria Poziello on 20/11/23.
//

import SwiftUI
import SwiftData

@main
struct MailAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Mail.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MailboxesView()
        }
        .modelContainer(sharedModelContainer)
    }
}
