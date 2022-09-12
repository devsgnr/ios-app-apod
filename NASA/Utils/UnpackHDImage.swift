//
//  UnpackHDImage.swift
//  NASA
//
//  Created by Emmanuel Watila on 09/09/2022.
//

import SwiftUI

struct UnpackHDImage: View {
    let url: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 400)
        } else {
            Image("galaxy")
                .resizable()
                .ignoresSafeArea(edges: .top)
                .frame(height: 400)
                .blur(radius: 5)
                .onAppear { fetchImage() }
        }
    }
    
    private func fetchImage() {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, _, _ in
            self.data = data
        })
        
        task.resume()
    }
}
