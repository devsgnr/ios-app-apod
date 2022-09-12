//
//  UnpackImage.swift
//  NASA
//
//  Created by Emmanuel Watila on 09/09/2022.
//

import SwiftUI

struct UnpackImage: View {
    let url: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 170, height: 170)
                .cornerRadius(15)
                .aspectRatio(contentMode: .fill)
        } else {
            Image("galaxy")
                .resizable()
                .frame(width: 170, height: 170)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
                .blur(radius: 2.5)
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
