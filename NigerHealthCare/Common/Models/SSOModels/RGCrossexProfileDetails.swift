//
//  Detail.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfileDetails: NSObject, Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let phones = "phones"
    static let motherMaidenName = "mother_maiden_name"
    static let address = "address"
    static let age = "age"
    static let gender = "gender"
    static let active = "active"
    static let minor = "minor"
    static let emails = "emails"
    static let lastName = "last_name"
    static let identifiers = "identifiers"
    static let firstName = "first_name"
    static let phone = "phone"
    static let userType = "user_type"
    static let profileComplete = "profile_complete"
    static let dob = "dob"
  }

  // MARK: Properties
  public var phones: [RGCrossexProfilePhones]?
  public var motherMaidenName: String?
  public var address: RGCrossexProfileAddress?
  public var age: RGCrossexProfileAge?
  public var gender: String?
  public var active: Bool? = false
  public var minor: Bool? = false
  public var emails: [Any]?
  public var lastName: String?
  public var identifiers: [RGCrossexProfileIdentifiers]?
  public var firstName: String?
  public var phone: String?
  public var userType: String?
  public var profileComplete: Bool? = false
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
    phones <- map[SerializationKeys.phones]
    motherMaidenName <- map[SerializationKeys.motherMaidenName]
    address <- map[SerializationKeys.address]
    age <- map[SerializationKeys.age]
    gender <- map[SerializationKeys.gender]
    active <- map[SerializationKeys.active]
    minor <- map[SerializationKeys.minor]
    emails <- map[SerializationKeys.emails]
    lastName <- map[SerializationKeys.lastName]
    identifiers <- map[SerializationKeys.identifiers]
    firstName <- map[SerializationKeys.firstName]
    phone <- map[SerializationKeys.phone]
    userType <- map[SerializationKeys.userType]
    profileComplete <- map[SerializationKeys.profileComplete]
    dob <- map[SerializationKeys.dob]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = phones { dictionary[SerializationKeys.phones] = value.map { $0.dictionaryRepresentation() } }
    if let value = motherMaidenName { dictionary[SerializationKeys.motherMaidenName] = value }
    if let value = address { dictionary[SerializationKeys.address] = value.dictionaryRepresentation() }
    if let value = age { dictionary[SerializationKeys.age] = value.dictionaryRepresentation() }
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    dictionary[SerializationKeys.active] = active
    dictionary[SerializationKeys.minor] = minor
    if let value = emails { dictionary[SerializationKeys.emails] = value }
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = identifiers { dictionary[SerializationKeys.identifiers] = value.map { $0.dictionaryRepresentation() } }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = phone { dictionary[SerializationKeys.phone] = value }
    if let value = userType { dictionary[SerializationKeys.userType] = value }
    dictionary[SerializationKeys.profileComplete] = profileComplete
    if let value = dob { dictionary[SerializationKeys.dob] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.phones = aDecoder.decodeObject(forKey: SerializationKeys.phones) as? [RGCrossexProfilePhones]
    self.motherMaidenName = aDecoder.decodeObject(forKey: SerializationKeys.motherMaidenName) as? String
    self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? RGCrossexProfileAddress
    self.age = aDecoder.decodeObject(forKey: SerializationKeys.age) as? RGCrossexProfileAge
    self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
    self.active = aDecoder.decodeObject(forKey: SerializationKeys.active) as? Bool
    self.minor = aDecoder.decodeObject(forKey: SerializationKeys.minor) as? Bool
    self.emails = aDecoder.decodeObject(forKey: SerializationKeys.emails) as? [Any]
    self.lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
    self.identifiers = aDecoder.decodeObject(forKey: SerializationKeys.identifiers) as? [RGCrossexProfileIdentifiers]
    self.firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
    self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? String
    self.userType = aDecoder.decodeObject(forKey: SerializationKeys.userType) as? String
    self.profileComplete = aDecoder.decodeObject(forKey: SerializationKeys.profileComplete) as? Bool
    self.dob = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(phones, forKey: SerializationKeys.phones)
    aCoder.encode(motherMaidenName, forKey: SerializationKeys.motherMaidenName)
    aCoder.encode(address, forKey: SerializationKeys.address)
    aCoder.encode(age, forKey: SerializationKeys.age)
    aCoder.encode(gender, forKey: SerializationKeys.gender)
    aCoder.encode(active, forKey: SerializationKeys.active)
    aCoder.encode(minor, forKey: SerializationKeys.minor)
    aCoder.encode(emails, forKey: SerializationKeys.emails)
    aCoder.encode(lastName, forKey: SerializationKeys.lastName)
    aCoder.encode(identifiers, forKey: SerializationKeys.identifiers)
    aCoder.encode(firstName, forKey: SerializationKeys.firstName)
    aCoder.encode(phone, forKey: SerializationKeys.phone)
    aCoder.encode(userType, forKey: SerializationKeys.userType)
    aCoder.encode(profileComplete, forKey: SerializationKeys.profileComplete)
    aCoder.encode(dob, forKey: SerializationKeys.dob)
  }

}
