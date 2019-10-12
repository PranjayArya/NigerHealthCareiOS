//
//  Corporate.swift
//
//  Created by Abhayam Rastogi on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Corporate: NSObject, Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let serviceDomain = "serviceDomain"
    static let logo = "logo"
    static let id = "id"
    static let emailDomains = "emailDomains"
    static let b2bCorp = "b2bCorp"
    static let features = "features"
  }

  // MARK: Properties
  public var name: String?
  public var serviceDomain: String?
  public var logo: String?
  public var id: String?
  public var emailDomains: [String]?
  public var b2bCorp: Bool?
  public var features: [Features]?

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
    name <- map[SerializationKeys.name]
    serviceDomain <- map[SerializationKeys.serviceDomain]
    logo <- map[SerializationKeys.logo]
    id <- map[SerializationKeys.id]
    emailDomains <- map[SerializationKeys.emailDomains]
    b2bCorp <- map[SerializationKeys.b2bCorp]
    features <- map[SerializationKeys.features]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = serviceDomain { dictionary[SerializationKeys.serviceDomain] = value }
    if let value = logo { dictionary[SerializationKeys.logo] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = emailDomains { dictionary[SerializationKeys.emailDomains] = value }
    if let value = b2bCorp { dictionary[SerializationKeys.b2bCorp] = value }
    if let value = features { dictionary[SerializationKeys.features] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.serviceDomain = aDecoder.decodeObject(forKey: SerializationKeys.serviceDomain) as? String
    self.logo = aDecoder.decodeObject(forKey: SerializationKeys.logo) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.emailDomains = aDecoder.decodeObject(forKey: SerializationKeys.emailDomains) as? [String]
    self.b2bCorp = aDecoder.decodeObject(forKey: SerializationKeys.b2bCorp) as? Bool
    self.features = aDecoder.decodeObject(forKey: SerializationKeys.features) as? [Features]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(serviceDomain, forKey: SerializationKeys.serviceDomain)
    aCoder.encode(logo, forKey: SerializationKeys.logo)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(emailDomains, forKey: SerializationKeys.emailDomains)
    aCoder.encode(b2bCorp, forKey: SerializationKeys.b2bCorp)
    aCoder.encode(features, forKey: SerializationKeys.features)
  }

}
