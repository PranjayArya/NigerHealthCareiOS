//
//  CrossexProfile.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGCrossexProfile: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let user = "user"
    static let id = "id"
    static let code = "code"
    static let detail = "detail"
    static let version = "version"
  }

  // MARK: Properties
  public var user: RGCrossexProfileUser?
  public var id: String?
  public var code: Int?
  public var detail: RGCrossexProfileDetails?
  public var version: String?

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
    user <- map[SerializationKeys.user]
    id <- map[SerializationKeys.id]
    code <- map[SerializationKeys.code]
    detail <- map[SerializationKeys.detail]
    version <- map[SerializationKeys.version]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = user { dictionary[SerializationKeys.user] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = detail { dictionary[SerializationKeys.detail] = value.dictionaryRepresentation() }
    if let value = version { dictionary[SerializationKeys.version] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.user = aDecoder.decodeObject(forKey: SerializationKeys.user) as? RGCrossexProfileUser
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? Int
    self.detail = aDecoder.decodeObject(forKey: SerializationKeys.detail) as? RGCrossexProfileDetails
    self.version = aDecoder.decodeObject(forKey: SerializationKeys.version) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(user, forKey: SerializationKeys.user)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(detail, forKey: SerializationKeys.detail)
    aCoder.encode(version, forKey: SerializationKeys.version)
  }

}
