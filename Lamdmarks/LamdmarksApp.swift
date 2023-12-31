//
//  LamdmarksApp.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/24.
//

import SwiftUI

@main
struct LamdmarksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LandmarkList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(UserData())
        }
    }
}
