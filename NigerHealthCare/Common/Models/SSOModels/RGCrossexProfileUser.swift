//
//  User.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfileUser: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let identifier = "identifier"
  }

  // MARK: Properties
  public var identifier: String?

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
    identifier <- map[SerializationKeys.identifier]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = identifier { dictionary[SerializationKeys.identifier] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.identifier = aDecoder.decodeObject(forKey: SerializationKeys.identifier) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(identifier, forKey: SerializationKeys.identifier)
  }

}
