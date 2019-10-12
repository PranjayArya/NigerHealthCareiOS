//
//  CatalogService.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 07/09/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class CatalogServiceType: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let type = "type"
        static let descriptionValue = "description"
    }
    
    // MARK: Properties
    public var id: Int?
    public var type: String?
    public var descriptionValue: String?
    
    public required  init?(map: Map) { }
    
    public func mapping(map: Map) {
        self.id <- map[SerializationKeys.id]
        self.type <- map[SerializationKeys.type]
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
    }
    
}

class CatalogService: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let descriptionValue = "description"
        static let name = "name"
        static let catalogServiceType = "catalog_service_type"
        static let id = "id"
    }
    
    // MARK: Properties
    public var descriptionValue: String?
    public var name: String?
    public var catalogServiceType: CatalogServiceType?
    public var id: Int?

    public required  init?(map: Map) { }
    
    public func mapping(map: Map) {
        
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.name <- map[SerializationKeys.name]
        self.catalogServiceType <- map[SerializationKeys.catalogServiceType]
        self.id <- map[SerializationKeys.id]
    }
}
