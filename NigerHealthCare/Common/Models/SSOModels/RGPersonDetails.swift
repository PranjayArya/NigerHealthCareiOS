//
//  Details.swift
//
//  Created by Abhayam Rastogi on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGPersonDetails: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let motherMaidenName = "mother_maiden_name"
        static let lastName = "last_name"
        static let mobile = "mobile"
        static let firstName = "first_name"
        static let gender = "gender"
        static let userType = "user_type"
        static let active = "active"
        static let minor = "minor"
        static let dob = "dob"
    }
    
    // MARK: Properties
    public var motherMaidenName: String?
    public var lastName: String?
    public var mobile: String?
    public var firstName: String?
    public var gender: String?
    public var userType: String?
    public var active: Bool? = false
    public var minor: Bool? = false
    public var dob: String?
    
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
        motherMaidenName <- map[SerializationKeys.motherMaidenName]
        lastName <- map[SerializationKeys.lastName]
        mobile <- map[SerializationKeys.mobile]
        firstName <- map[SerializationKeys.firstName]
        gender <- map[SerializationKeys.gender]
        userType <- map[SerializationKeys.userType]
        active <- map[SerializationKeys.active]
        minor <- map[SerializationKeys.minor]
        dob <- map[SerializationKeys.dob]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = motherMaidenName { dictionary[SerializationKeys.motherMaidenName] = value }
        if let value = lastName { dictionary[SerializationKeys.lastName] = value }
        if let value = mobile { dictionary[SerializationKeys.mobile] = value }
        if let value = firstName { dictionary[SerializationKeys.firstName] = value }
        if let value = gender { dictionary[SerializationKeys.gender] = value }
        if let value = userType { dictionary[SerializationKeys.userType] = value }
        dictionary[SerializationKeys.active] = active
        dictionary[SerializationKeys.minor] = minor
        if let value = dob { dictionary[SerializationKeys.dob] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.motherMaidenName = aDecoder.decodeObject(forKey: SerializationKeys.motherMaidenName) as? String
        self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
        self.mobile = aDecoder.decodeObject(forKey: SerializationKeys.mobile) as? String
        self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
        self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
        self.userType = aDecoder.decodeObject(forKey: SerializationKeys.userType) as? String
        self.active = aDecoder.decodeBool(forKey: SerializationKeys.active)
        self.minor = aDecoder.decodeBool(forKey: SerializationKeys.minor)
        self.dob = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(motherMaidenName, forKey: SerializationKeys.motherMaidenName)
        aCoder.encode(lastName, forKey: SerializationKeys.lastName)
        aCoder.encode(mobile, forKey: SerializationKeys.mobile)
        aCoder.encode(firstName, forKey: SerializationKeys.firstName)
        aCoder.encode(gender, forKey: SerializationKeys.gender)
        aCoder.encode(userType, forKey: SerializationKeys.userType)
        aCoder.encode(active, forKey: SerializationKeys.active)
        aCoder.encode(minor, forKey: SerializationKeys.minor)
        aCoder.encode(dob, forKey: SerializationKeys.dob)
    }
    
}
