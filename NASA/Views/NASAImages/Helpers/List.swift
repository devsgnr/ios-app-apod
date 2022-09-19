//
//  List.swift
//  NASA
//
//  Created by Emmanuel Watila on 07/09/2022.
//

import SwiftUI

struct List: View {
    @EnvironmentObject var data: ViewData
    
    private var obj = ViewData()
    private var twoColumnGrid = Array(repeating: GridItem(.adaptive(minimum: 180)), count: 2)
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch data.state {
                    case ResponseState.Loading:
                        VStack {
                            ProgressView{
                                Text("Fetching really rad NASA pictures")
                                    .font(.subheadline)
                                    .padding(.top, 2.5)
                            }
                            .padding(.top, 50)
                        }
                    
                    case ResponseState.Failed:
                        VStack(alignment: .center) {
                            Text("No content")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 2.5)
                            
                            Text("Error fetching data. Pull down \nto refresh")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 50)
                    
                    default:
                        LazyVGrid(columns: twoColumnGrid) {
                            ForEach(data.pictures, id: \.self) {picture in
                                NavigationLink {
                                    ImageDetails(data: picture)
                                } label: {
                                    ListImage(data: picture)
                                }
                            }
                        }
                        .padding()
                    }
            }
            .navigationTitle("Pictures")
            .refreshable {
                await data.refresh()
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var data = ViewData()
    
    static var previews: some View {
        List()
            .environmentObject(data)
    }
}
