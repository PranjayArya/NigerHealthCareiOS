//
//  PersonProfile.swift
//
//  Created by Abhayam Rastogi on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGPersonProfile: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let person = "person"
    }
    
    // MARK: Properties
    public var person: RGPerson?
    
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
        person <- map[SerializationKeys.person]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = person { dictionary[SerializationKeys.person] = value.dictionaryRepresentation() }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.person = aDecoder.decodeObject(forKey: SerializationKeys.person) as? RGPerson
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(person, forKey: SerializationKeys.person)
    }
    
}
