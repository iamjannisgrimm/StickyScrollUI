//
//  MeMyselfApp.swift
//  Shared
//
//  Created by Jannis Grimm on 9/6/21.
//

import SwiftUI

@main
struct MeMyselfApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(MainCode())
        }
    }
}
