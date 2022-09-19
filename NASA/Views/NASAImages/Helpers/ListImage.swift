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
            
            Text(data.title.count > 20 ? "\(data.title.prefix(17))..." : data.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
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
