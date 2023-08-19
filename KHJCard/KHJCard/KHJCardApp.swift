//
//  KHJCardApp.swift
//  KHJCard
//
//  Created by KIM Hyung Jun on 2023/08/18.
//

import SwiftUI

@main
struct KHJCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
