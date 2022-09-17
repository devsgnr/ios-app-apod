//
//  ContentView.swift
//  NASA
//
//  Created by Emmanuel Watila on 06/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            List()
                .tabItem{
                    Label("Pictures", systemImage: "photo.on.rectangle.angled")
                }
            FavoritePictures()
                .tabItem{
                    Label("Favorites", systemImage: "star.fill")
                }
            
            Info()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
