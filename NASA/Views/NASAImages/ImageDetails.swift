//  ImageDetails.swift
//  NASA
//
//  Created by Emmanuel Watila on 07/09/2022.

import SwiftUI

struct ImageDetails: View {
    var data: PictureData
    
    var body: some View {
        ScrollView {
            data.hdimage
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 0.5)
                    
                Text(data.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text("Description")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 0.5)
                Text(data.explanation)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .navigationTitle(data.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ImageDetails_Previews: PreviewProvider {
    static var data = ViewData().pictures
    
    static var previews: some View {
        ImageDetails(data: data[0])
    }
}
