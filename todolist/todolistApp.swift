//
//  todolistApp.swift
//  todolist
//
//  Created by 손영하  on 2023/08/09.
//

import SwiftUI

@main
struct todolistApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
