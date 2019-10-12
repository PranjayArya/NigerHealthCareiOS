//
//  User.swift
//  Reach
//
//  Created by DelTen Obino on 13/09/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper

public final class ReachUser: NSObject, Mappable, NSCoding {
    
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let rgUUID = "rgUUID"
        static let profileImage = "profileImage"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let rgUserName = "rgUserName"
        static let id = "id"
        static let mobile = "mobile"
        static let gender = "gender"
        static let dob = "dob"
        static let emailId = "emailId"
        static let activationDate = "activationDate"
        static let rgConnectId = "rgConnectId"
    }
    
    // MARK: Properties
    public var rgUUID: String?
    public var profileImage: String?
    public var firstName: String?
    public var lastName: String?
    public var rgUserName: String?
    public var id: String?
    public var mobile: String?
    public var gender: String?
    public var dob: String?
    public var emailId: String?
    public var activationDate: String?
    public var rgConnectId: String?
    
    
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        self.rgUUID <- map[SerializationKeys.rgUUID]
        self.profileImage <- map[SerializationKeys.profileImage]
        self.firstName <- map[SerializationKeys.firstName]
        self.lastName <- map[SerializationKeys.lastName]
        self.rgUserName <- map[SerializationKeys.rgUserName]
        self.id <- map[SerializationKeys.id]
        self.mobile <- map[SerializationKeys.mobile]
        self.gender <- map[SerializationKeys.gender]
        self.dob <- map[SerializationKeys.dob]
        self.emailId <- map[SerializationKeys.emailId]
        self.activationDate <- map[SerializationKeys.activationDate]
        self.rgConnectId <- map[SerializationKeys.rgConnectId]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = rgUUID { dictionary[SerializationKeys.rgUUID] = value }
        if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
        if let value = firstName { dictionary[SerializationKeys.firstName] = value }
        if let value = lastName { dictionary[SerializationKeys.lastName] = value }
        if let value = rgUserName { dictionary[SerializationKeys.rgUserName] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = mobile { dictionary[SerializationKeys.mobile] = value }
        if let value = gender { dictionary[SerializationKeys.gender] = value }
        if let value = dob { dictionary[SerializationKeys.dob] = value }
        if let value = emailId { dictionary[SerializationKeys.emailId] = value }
        if let value = activationDate { dictionary[SerializationKeys.activationDate] = value }
        if let value = rgConnectId { dictionary[SerializationKeys.rgConnectId] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.rgUUID = aDecoder.decodeObject(forKey: SerializationKeys.rgUUID) as? String
        self.profileImage = aDecoder.decodeObject(forKey: SerializationKeys.profileImage) as? String
        self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
        self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
        self.rgUserName = aDecoder.decodeObject(forKey: SerializationKeys.rgUserName) as? String
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.mobile = aDecoder.decodeObject(forKey: SerializationKeys.mobile) as? String
        self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
        self.dob = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
        self.emailId = aDecoder.decodeObject(forKey: SerializationKeys.emailId) as? String
        self.activationDate = aDecoder.decodeObject(forKey: SerializationKeys.activationDate) as? String
        self.rgConnectId = aDecoder.decodeObject(forKey: SerializationKeys.rgConnectId) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(rgUUID, forKey: SerializationKeys.rgUUID)
        aCoder.encode(profileImage, forKey: SerializationKeys.profileImage)
        aCoder.encode(firstName, forKey: SerializationKeys.firstName)
        aCoder.encode(lastName, forKey: SerializationKeys.lastName)
        aCoder.encode(rgUserName, forKey: SerializationKeys.rgUserName)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(mobile, forKey: SerializationKeys.mobile)
        aCoder.encode(gender, forKey: SerializationKeys.gender)
        aCoder.encode(dob, forKey: SerializationKeys.dob)
        aCoder.encode(emailId, forKey: SerializationKeys.emailId)
        aCoder.encode(activationDate, forKey: SerializationKeys.activationDate)
        aCoder.encode(rgConnectId, forKey: SerializationKeys.rgConnectId)
    }
    
}
