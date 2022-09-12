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
            data.image
                
            Text(data.date)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 0.2)
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
