//
//  Features.swift
//  Reach
//
//  Created by Rahul Nagpal on 09/11/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Features: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let title = "title"
        static let allowed = "allowed"
        static let subfeatures = "subfeatures"
    }
    
    // MARK: Properties
    public var title: String?
    public var allowed: Bool?
    public var subfeatures: [Features]?
    
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
        title <- map[SerializationKeys.title]
        allowed <- map[SerializationKeys.allowed]
        subfeatures <- map[SerializationKeys.subfeatures]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = allowed { dictionary[SerializationKeys.allowed] = value }
        if let value = subfeatures { dictionary[SerializationKeys.subfeatures] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.allowed = aDecoder.decodeObject(forKey: SerializationKeys.allowed) as? Bool
        self.subfeatures = aDecoder.decodeObject(forKey: SerializationKeys.subfeatures) as? [Features]
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(allowed, forKey: SerializationKeys.allowed)
        aCoder.encode(subfeatures, forKey: SerializationKeys.subfeatures)
    }
    
}
