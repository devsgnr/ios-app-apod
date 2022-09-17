//
//  NASAApp.swift
//  NASA
//
//  Created by Emmanuel Watila on 06/09/2022.
//

import SwiftUI

@main
struct NASAApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    @StateObject private var data = ViewData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) {_ in
            persistenceController.save()
        }
    }
}
