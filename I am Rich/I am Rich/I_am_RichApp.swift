//
//  I_am_RichApp.swift
//  I am Rich
//
//  Created by KIM Hyung Jun on 2023/08/18.
//

import SwiftUI

@main
struct I_am_RichApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
