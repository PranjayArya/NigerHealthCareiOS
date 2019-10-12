//
//  Age.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfileAge: NSObject, Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let months = "months"
    static let years = "years"
    static let days = "days"
  }

  // MARK: Properties
  public var months: Int?
  public var years: Int?
  public var days: Int?

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
    months <- map[SerializationKeys.months]
    years <- map[SerializationKeys.years]
    days <- map[SerializationKeys.days]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = months { dictionary[SerializationKeys.months] = value }
    if let value = years { dictionary[SerializationKeys.years] = value }
    if let value = days { dictionary[SerializationKeys.days] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.months = aDecoder.decodeObject(forKey: SerializationKeys.months) as? Int
    self.years = aDecoder.decodeObject(forKey: SerializationKeys.years) as? Int
    self.days = aDecoder.decodeObject(forKey: SerializationKeys.days) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(months, forKey: SerializationKeys.months)
    aCoder.encode(years, forKey: SerializationKeys.years)
    aCoder.encode(days, forKey: SerializationKeys.days)
  }

}
