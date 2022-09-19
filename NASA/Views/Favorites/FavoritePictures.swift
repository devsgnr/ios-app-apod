//
//  FavoritePictures.swift
//  NASA
//
//  Created by Emmanuel Watila on 17/09/2022.
//

import SwiftUI

struct FavoritePictures: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PictureDataModel.title, ascending: false)],
        animation: .default
    ) private var pictures: FetchedResults<PictureDataModel>
    
    private var twoColumnGrid = Array(repeating: GridItem(.adaptive(minimum: 180)), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView {
                if self.pictures.isEmpty {
                    VStack {
                        Text("No favorites yet")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Go pick some awesome favorites and throw them in here")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 50)
                } else {
                    LazyVGrid(columns: twoColumnGrid) {
                        ForEach(Array(pictures.enumerated()), id: \.offset) { offset, picture in
                            NavigationLink {
                                ScrollView {
                                    UnpackHDImage(url: picture.url!)
                                    
                                    VStack(alignment: .leading) {
                                        Text(picture.title!)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 0.5)
                                        
                                        Text(picture.date!)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        
                                        Divider()
                                        
                                        Text("Description")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 0.5)
                                        Text(picture.explanation!)
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                }
                                .navigationTitle(picture.title!)
                                .navigationBarTitleDisplayMode(.inline)
                            } label: {
                                VStack(alignment: .leading) {
                                    UnpackImage(url: picture.url!)
                                        .contextMenu {
                                            Text(picture.title!)
                                                .font(.system(size: 1))
                                                .foregroundColor(.gray)
                                            
                                            Button(action: { UIPasteboard.general.string = picture.url! }) {
                                                Label("Copy Link", systemImage: "doc.on.doc")
                                            }
                                            
                                            Button(role: .destructive, action: { deleteItem(offset) }) {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        }
                                    
                                    Text(picture.title!.count > 20 ? "\(picture.title!.prefix(17))..." : picture.title!)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Favorites")
            .padding()
        }
    }
    
    func deleteItem(_ index: Int) {
        let picture = pictures[index]
        viewContext.delete(picture)
            
        PersistenceController.shared.save()
    }
}

struct FavoritePictures_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePictures()
    }
}
