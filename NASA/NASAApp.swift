//
//  NASAApp.swift
//  NASA
//
//  Created by Emmanuel Watila on 06/09/2022.
//

import SwiftUI

@main
struct NASAApp: App {
    @StateObject private var data = ViewData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
