//
//  MealappApp.swift
//  Mealapp
//
//  Created by Sydney Westrick on 5/18/23.
//

import SwiftUI

@main
struct MealappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
