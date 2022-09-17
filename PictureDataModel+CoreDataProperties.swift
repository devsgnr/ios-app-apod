//
//  PictureDataModel+CoreDataProperties.swift
//  NASA
//
//  Created by Emmanuel Watila on 17/09/2022.
//
//

import Foundation
import CoreData


extension PictureDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureDataModel> {
        return NSFetchRequest<PictureDataModel>(entityName: "PictureDataModel")
    }

    @NSManaged public var copyright: String?
    @NSManaged public var date: String?
    @NSManaged public var explanation: String?
    @NSManaged public var favorite: Bool
    @NSManaged public var hdurl: String?
    @NSManaged public var image: Data?
    @NSManaged public var media_type: String?
    @NSManaged public var service_version: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension PictureDataModel : Identifiable {

}
