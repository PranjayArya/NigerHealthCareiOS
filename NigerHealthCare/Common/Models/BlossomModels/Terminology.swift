//
//  Terminology.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 21/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class Terminology: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let type = "type"
        static let descriptionValue = "description"
        static let name = "name"
        //MARK:- for stickers in moment modules
        static let label = "label"
        static let url = "url"

    }
    
    // MARK: Properties
    public var id: Int?
    public var type: String?
    public var descriptionValue: String?
    public var name: String?
    public var label: String?
    public var url: String?

    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        
        self.id <- map[SerializationKeys.id]
        self.type <- map[SerializationKeys.type]
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.name <- map[SerializationKeys.name]
        self.label <- map[SerializationKeys.label]
        self.url <- map[SerializationKeys.url]

    }
}
