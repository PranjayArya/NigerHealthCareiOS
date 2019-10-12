//
//  Person.swift
//
//  Created by Abhayam Rastogi on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGPerson: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let details = "details"
        static let version = "version"
        static let id = "id"
        static let code = "code"
        static let username = "username"
    }
    
    // MARK: Properties
    public var details: RGPersonDetails?
    public var version: String?
    public var id: String?
    public var code: Int?
    public var username: String?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        details <- map[SerializationKeys.details]
        version <- map[SerializationKeys.version]
        id <- map[SerializationKeys.id]
        code <- map[SerializationKeys.code]
        username <- map[SerializationKeys.username]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = details { dictionary[SerializationKeys.details] = value.dictionaryRepresentation() }
        if let value = version { dictionary[SerializationKeys.version] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = code { dictionary[SerializationKeys.code] = value }
        if let value = username { dictionary[SerializationKeys.username] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.details = aDecoder.decodeObject(forKey: SerializationKeys.details) as? RGPersonDetails
        self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
        self.username = aDecoder.decodeObject(forKey: SerializationKeys.username) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(details, forKey: SerializationKeys.details)
        aCoder.encode(version, forKey: SerializationKeys.version)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(code, forKey: SerializationKeys.code)
        aCoder.encode(username, forKey: SerializationKeys.username)
    }
    
}
