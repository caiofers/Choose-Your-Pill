//
//  Choose_Your_PillApp.swift
//  Choose Your Pill
//
//  Created by Caio Fernandes on 20/06/21.
//

import SwiftUI

@main
struct Choose_Your_PillApp: App {
    let persistence = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceManager.preview.container.viewContext)
        }
    }
}
