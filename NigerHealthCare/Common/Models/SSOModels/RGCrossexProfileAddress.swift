//
//  Address.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfileAddress:NSObject, Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let district = "district"
    static let city = "city"
    static let state = "state"
    static let number = "number"
    static let streetName = "street_name"
    static let country = "country"
  }

  // MARK: Properties
  public var district: String?
  public var city: String?
  public var state: String?
  public var number: String?
  public var streetName: String?
  public var country: String?

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
    district <- map[SerializationKeys.district]
    city <- map[SerializationKeys.city]
    state <- map[SerializationKeys.state]
    number <- map[SerializationKeys.number]
    streetName <- map[SerializationKeys.streetName]
    country <- map[SerializationKeys.country]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = district { dictionary[SerializationKeys.district] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = state { dictionary[SerializationKeys.state] = value }
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = streetName { dictionary[SerializationKeys.streetName] = value }
    if let value = country { dictionary[SerializationKeys.country] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.district = aDecoder.decodeObject(forKey: SerializationKeys.district) as? String
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.state = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
    self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? String
    self.streetName = aDecoder.decodeObject(forKey: SerializationKeys.streetName) as? String
    self.country = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(district, forKey: SerializationKeys.district)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(state, forKey: SerializationKeys.state)
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(streetName, forKey: SerializationKeys.streetName)
    aCoder.encode(country, forKey: SerializationKeys.country)
  }

}
