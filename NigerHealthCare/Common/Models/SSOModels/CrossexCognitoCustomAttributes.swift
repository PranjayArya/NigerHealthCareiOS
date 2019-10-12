//
//  CrossexCognitoCustomAttributes.swift
//
//  Created by Abhayam Rastogi on 29/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class CrossexCognitoCustomAttributes: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let customEmailDone = "customEmailDone"
    static let customSecurityQuestionDone = "customSecurityQuestionDone"
  }

  // MARK: Properties
  public var customEmailDone: Bool? = false
  public var customSecurityQuestionDone: Bool? = false

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
    customEmailDone <- map[SerializationKeys.customEmailDone]
    customSecurityQuestionDone <- map[SerializationKeys.customSecurityQuestionDone]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.customEmailDone] = customEmailDone
    dictionary[SerializationKeys.customSecurityQuestionDone] = customSecurityQuestionDone
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.customEmailDone = aDecoder.decodeBool(forKey: SerializationKeys.customEmailDone)
    self.customSecurityQuestionDone = aDecoder.decodeBool(forKey: SerializationKeys.customSecurityQuestionDone)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(customEmailDone, forKey: SerializationKeys.customEmailDone)
    aCoder.encode(customSecurityQuestionDone, forKey: SerializationKeys.customSecurityQuestionDone)
  }

}
