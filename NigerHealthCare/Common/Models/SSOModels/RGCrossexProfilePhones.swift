//
//  Phones.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfilePhones:NSObject, Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let verified = "verified"
    static let link = "link"
    static let value = "value"
    static let medium = "medium"
    static let otp = "otp"
    static let primary = "primary"
    static let deliver = "deliver"
  }

  // MARK: Properties
  public var verified: Bool? = false
  public var link: Bool? = false
  public var value: String?
  public var medium: String?
  public var otp: Int?
  public var primary: Bool? = false
  public var deliver: Bool? = false

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
    verified <- map[SerializationKeys.verified]
    link <- map[SerializationKeys.link]
    value <- map[SerializationKeys.value]
    medium <- map[SerializationKeys.medium]
    otp <- map[SerializationKeys.otp]
    primary <- map[SerializationKeys.primary]
    deliver <- map[SerializationKeys.deliver]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.verified] = verified
    dictionary[SerializationKeys.link] = link
    if let value = value { dictionary[SerializationKeys.value] = value }
    if let value = medium { dictionary[SerializationKeys.medium] = value }
    if let value = otp { dictionary[SerializationKeys.otp] = value }
    dictionary[SerializationKeys.primary] = primary
    dictionary[SerializationKeys.deliver] = deliver
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.verified = aDecoder.decodeBool(forKey: SerializationKeys.verified)
    self.link = aDecoder.decodeBool(forKey: SerializationKeys.link)
    self.value = aDecoder.decodeObject(forKey: SerializationKeys.value) as? String
    self.medium = aDecoder.decodeObject(forKey: SerializationKeys.medium) as? String
    self.otp = aDecoder.decodeObject(forKey: SerializationKeys.otp) as? Int
    self.primary = aDecoder.decodeBool(forKey: SerializationKeys.primary)
    self.deliver = aDecoder.decodeBool(forKey: SerializationKeys.deliver)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(verified, forKey: SerializationKeys.verified)
    aCoder.encode(link, forKey: SerializationKeys.link)
    aCoder.encode(value, forKey: SerializationKeys.value)
    aCoder.encode(medium, forKey: SerializationKeys.medium)
    aCoder.encode(otp, forKey: SerializationKeys.otp)
    aCoder.encode(primary, forKey: SerializationKeys.primary)
    aCoder.encode(deliver, forKey: SerializationKeys.deliver)
  }

}
