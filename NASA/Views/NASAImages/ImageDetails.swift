//  ImageDetails.swift
//  NASA
//
//  Created by Emmanuel Watila on 07/09/2022.

import SwiftUI

struct ImageDetails: View {
    @Environment(\.managedObjectContext) var context
    
    var data: PictureData
    
    var body: some View {
        ScrollView {
            UnpackHDImage(url: data.url)
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 0.5)
                    
                HStack {
                    Text(data.date)
                        .font(.subheadline)
                    .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: addPictureToFav) {
                        Label("", systemImage: "star")
                    }
                }
                
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
    
    func addPictureToFav() {
        let picture = PictureDataModel(context: context)
        picture.url = data.url
        picture.title = data.title
        picture.date = data.date
        picture.explanation = data.explanation
        
        if context.hasChanges {
            PersistenceController.shared.save()
        }
    }
}


struct ImageDetails_Previews: PreviewProvider {
    static var data = ViewData().pictures
    
    static var previews: some View {
        ImageDetails(data: data[0])
    }
}
