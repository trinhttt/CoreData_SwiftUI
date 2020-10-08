//
//  CoreData_SwiftUIApp.swift
//  CoreData_SwiftUI
//
//  Created by Trinh Thai on 10/9/20.
//

import SwiftUI

@main
struct CoreData_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
