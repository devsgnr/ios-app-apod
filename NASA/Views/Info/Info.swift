//
//  Info.swift
//  NASA
//
//  Created by Emmanuel Watila on 11/09/2022.
//

import SwiftUI

struct Info: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("NASA APOD")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Text("Astronomy Pictures Of the Day")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Divider()
                
                Text(
                    """
                    One of the most popular websites at NASA is the Astronomy Picture of the Day. In fact, this website is one of the most popular websites across all federal agencies. It has the popular appeal of a Justin Bieber video. This endpoint structures the APOD imagery and associated metadata so that it can be repurposed for other applications. In addition, if the concept_tags parameter is set to True, then keywords derived from the image explanation are returned. These keywords could be used as auto-generated hashtags for twitter or instagram feeds; but generally help with discoverability of relevant imagery.
                    This application is built using the APOD API
                    """
                )
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                Text("Developed by Emmanuel Watila")
                    .padding(.top, 15)
            }
            .padding()
        }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
