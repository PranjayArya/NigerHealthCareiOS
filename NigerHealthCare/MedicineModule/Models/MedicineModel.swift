//
//  MedicineModel.swift
//  NigerHealthCare
//
//  Created by Pranjay on 31/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import ObjectMapper

public final class MedicineModel :Mappable {
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let name = "name"
        static let code = "code"
        static let categoryCode = "categoryCode"
        static let subCategoryCode = "subCategoryCode"
        static let unitPack = "unitPack"
        static let category = "category"
        static let price = "price"
        static let uses = "uses"
        static let color = "color"
        static let shape = "shape"
        static let isAvailable = "isAvailable"
    }
    
    // MARK: Properties
     public var id: Int?
     public var name: String?
     public var code: String?
     public var categoryCode: Int?
     public var subCategoryCode: Int?
     public var unitPack: String?
     public var category: String?
     public var price:Int?
     public var uses: String?
     public var color: String?
     public var shape: String?
     public var isAvailable:Bool?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        id <- map[SerializationKeys.id]
        name <- map[SerializationKeys.name]
        code <- map[SerializationKeys.code]
        categoryCode <- map[SerializationKeys.categoryCode]
        subCategoryCode <- map[SerializationKeys.subCategoryCode]
        unitPack <- map[SerializationKeys.unitPack]
        category <- map[SerializationKeys.category]
        price <- map[SerializationKeys.price]
        uses <- map[SerializationKeys.uses]
        color <- map[SerializationKeys.color]
        shape <- map[SerializationKeys.shape]
        isAvailable <- map[SerializationKeys.isAvailable]
        
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public func mapping(map: Map) {
        id <- map[SerializationKeys.id]
        name <- map[SerializationKeys.name]
        code <- map[SerializationKeys.code]
        categoryCode <- map[SerializationKeys.categoryCode]
        subCategoryCode <- map[SerializationKeys.subCategoryCode]
        unitPack <- map[SerializationKeys.unitPack]
        category <- map[SerializationKeys.category]
        price <- map[SerializationKeys.price]
        uses <- map[SerializationKeys.uses]
        color <- map[SerializationKeys.color]
        shape <- map[SerializationKeys.shape]
        isAvailable <- map[SerializationKeys.isAvailable]
    }
}
