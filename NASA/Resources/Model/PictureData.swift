//  ViewModel.swift
//  NASA
//
//  Created by Emmanuel Watila on 07/09/2022.

import Foundation
import SwiftUI

struct PictureData: Hashable, Codable {
    var date: String
    var explanation: String
    var media_type: String
    var service_version: String
    var copyright: String?
    var title: String
    var hdurl: String?
    var url: String
    
    var image: some View {
        UnpackImage(url: url)
    }
    
    var hdimage: some View {
        UnpackHDImage(url: url)
    }
}
