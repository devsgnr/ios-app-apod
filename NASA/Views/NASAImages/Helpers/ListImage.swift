//
//  ListImage.swift
//  NASA
//
//  Created by Emmanuel Watila on 06/09/2022.
//

import SwiftUI


struct ListImage: View {
    var data: PictureData
    
    var body: some View {
        VStack(alignment: .leading) {
            UnpackImage(url: data.url)
            
            Text(data.title.prefix(20))
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            Text(data.date)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct ListImage_Previews: PreviewProvider {
    static var pictures = ViewData().pictures
    
    static var previews: some View {
        Group {
            ListImage(data: pictures[0])
        }
    }
}
