//
//  HealthFacilityModel.swift
//  NigerHealthCare
//
//  Created by Pranjay on 25/04/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import ObjectMapper

public final class HealthFacilityModel :Mappable {
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let name = "name"
        static let code = "code"
        static let lgaCode = "lgaCode"
        static let stateCode = "stateCode"
        static let lga = "lga"
        static let level = "level"
        static let lat = "lat"
        static let lng = "lng"
        
    }
    
    // MARK: Properties
    public var id: Int?
    public var name: String?
    public var code: String?
    public var lgaCode: String?
    public var stateCode: String?
    public var lga: String?
    public var level: String?
    public var lat: Double?
    public var lng: Double?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        id <- map[SerializationKeys.id]
        name <- map[SerializationKeys.name]
        code <- map[SerializationKeys.code]
        lgaCode <- map[SerializationKeys.lgaCode]
        stateCode <- map[SerializationKeys.stateCode]
        lga <- map[SerializationKeys.lga]
        level <- map[SerializationKeys.level]
        lat <- map[SerializationKeys.lat]
        lng <- map[SerializationKeys.lng]
        
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public func mapping(map: Map) {
        id <- map[SerializationKeys.id]
        name <- map[SerializationKeys.name]
        code <- map[SerializationKeys.code]
        lgaCode <- map[SerializationKeys.lgaCode]
        stateCode <- map[SerializationKeys.stateCode]
        lga <- map[SerializationKeys.lga]
        level <- map[SerializationKeys.level]
        lat <- map[SerializationKeys.lat]
        lng <- map[SerializationKeys.lng]
        
    }
}
