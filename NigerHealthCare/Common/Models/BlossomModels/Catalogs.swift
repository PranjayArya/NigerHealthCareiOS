//
//  Catalogs.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 07/09/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class Catalogs: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let locationID = "location_id"
        static let id = "id"
        static let catalogService = "catalog_service"
        static let doctorID = "doctor_id"
        static let price = "price"
        static let tax = "tax"
    }
    
    // MARK: Properties
    public var locationID: Int?
    public var id: Int?
    public var catalogService: CatalogService?
    public var doctorID: Int?
    public var price: String?
    public var tax: String?
    
    public required  init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        self.locationID <- map[SerializationKeys.locationID]
        self.id <- map[SerializationKeys.id]
        self.catalogService <- map[SerializationKeys.catalogService]
        self.doctorID <- map[SerializationKeys.doctorID]
        self.price <- map[SerializationKeys.price]
        self.tax <- map[SerializationKeys.tax]
    }
}
