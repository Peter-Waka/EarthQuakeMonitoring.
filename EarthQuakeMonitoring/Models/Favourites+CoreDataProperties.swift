//
//  Favourites+CoreDataProperties.swift
//  EarthQuakeMonitoring
//
//  Created by EMTECH MAC on 02/07/2024.
//
//

import Foundation
import CoreData


extension Favourites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourites> {
        return NSFetchRequest<Favourites>(entityName: "FavouritesModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var latitute: Double
    @NSManaged public var longitude: Double
    @NSManaged public var country: String?

}

extension Favourites : Identifiable {

}
