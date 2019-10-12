//
//  BaseClass.swift
//
//  Created by Abhayam Rastogi on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class RGSSOLoginResponse: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let crossexCognitoCustomAttributes = "crossex_cognito_custom_attributes"
        static let requestId = "request_id"
        static let encryptRefreshToken = "encrypt_refresh_token"
        static let patientId = "patient_id"
        static let encryptIdToken = "encrypt_id_token"
        static let expSession = "exp_session"
        static let idToken = "id_token"
        static let encryptAccessToken = "encrypt_access_token"
        static let refreshToken = "refresh_token"
        static let accessToken = "access_token"
        static let personProfile = "person_profile"
        static let crossexProfile = "crossex_profile"
        static let expIdToken = "exp_id_token"
        static let expAccessToken = "exp_access_token"
    }
    
    // MARK: Properties
    public var crossexCognitoCustomAttributes: CrossexCognitoCustomAttributes?
    public var requestId: String?
    public var encryptRefreshToken: String?
    public var patientId: String?
    public var encryptIdToken: String?
    public var expSession: Int?
    public var idToken: String?
    public var encryptAccessToken: String?
    public var refreshToken: String?
    public var accessToken: String?
    public var personProfile: RGPersonProfile?
    public var crossexProfile: RGCrossexProfile?
    public var expIdToken: Int?
    public var expAccessToken: Int?
    
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
        crossexCognitoCustomAttributes <- map[SerializationKeys.crossexCognitoCustomAttributes]
        requestId <- map[SerializationKeys.requestId]
        encryptRefreshToken <- map[SerializationKeys.encryptRefreshToken]
        patientId <- map[SerializationKeys.patientId]
        encryptIdToken <- map[SerializationKeys.encryptIdToken]
        expSession <- map[SerializationKeys.expSession]
        idToken <- map[SerializationKeys.idToken]
        encryptAccessToken <- map[SerializationKeys.encryptAccessToken]
        refreshToken <- map[SerializationKeys.refreshToken]
        accessToken <- map[SerializationKeys.accessToken]
        personProfile <- map[SerializationKeys.personProfile]
        crossexProfile <- map[SerializationKeys.crossexProfile]
        expIdToken <- map[SerializationKeys.expIdToken]
        expAccessToken <- map[SerializationKeys.expAccessToken]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = crossexCognitoCustomAttributes { dictionary[SerializationKeys.crossexCognitoCustomAttributes] = value.dictionaryRepresentation() }
        if let value = requestId { dictionary[SerializationKeys.requestId] = value }
        if let value = encryptRefreshToken { dictionary[SerializationKeys.encryptRefreshToken] = value }
        if let value = patientId { dictionary[SerializationKeys.patientId] = value }
        if let value = encryptIdToken { dictionary[SerializationKeys.encryptIdToken] = value }
        if let value = expSession { dictionary[SerializationKeys.expSession] = value }
        if let value = idToken { dictionary[SerializationKeys.idToken] = value }
        if let value = encryptAccessToken { dictionary[SerializationKeys.encryptAccessToken] = value }
        if let value = refreshToken { dictionary[SerializationKeys.refreshToken] = value }
        if let value = accessToken { dictionary[SerializationKeys.accessToken] = value }
        if let value = personProfile { dictionary[SerializationKeys.personProfile] = value.dictionaryRepresentation() }
        if let value = crossexProfile { dictionary[SerializationKeys.crossexProfile] = value.dictionaryRepresentation() }
        if let value = expIdToken { dictionary[SerializationKeys.expIdToken] = value }
        if let value = expAccessToken { dictionary[SerializationKeys.expAccessToken] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.crossexCognitoCustomAttributes = aDecoder.decodeObject(forKey: SerializationKeys.crossexCognitoCustomAttributes) as? CrossexCognitoCustomAttributes
        self.requestId = aDecoder.decodeObject(forKey: SerializationKeys.requestId) as? String
        self.encryptRefreshToken = aDecoder.decodeObject(forKey: SerializationKeys.encryptRefreshToken) as? String
        self.patientId = aDecoder.decodeObject(forKey: SerializationKeys.patientId) as? String
        self.encryptIdToken = aDecoder.decodeObject(forKey: SerializationKeys.encryptIdToken) as? String
        self.expSession = aDecoder.decodeObject(forKey: SerializationKeys.expSession) as? Int
        self.idToken = aDecoder.decodeObject(forKey: SerializationKeys.idToken) as? String
        self.encryptAccessToken = aDecoder.decodeObject(forKey: SerializationKeys.encryptAccessToken) as? String
        self.refreshToken = aDecoder.decodeObject(forKey: SerializationKeys.refreshToken) as? String
        self.accessToken = aDecoder.decodeObject(forKey: SerializationKeys.accessToken) as? String
        self.personProfile = aDecoder.decodeObject(forKey: SerializationKeys.personProfile) as? RGPersonProfile
        self.crossexProfile = aDecoder.decodeObject(forKey: SerializationKeys.crossexProfile) as? RGCrossexProfile
        self.expIdToken = aDecoder.decodeObject(forKey: SerializationKeys.expIdToken) as? Int
        self.expAccessToken = aDecoder.decodeObject(forKey: SerializationKeys.expAccessToken) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(crossexCognitoCustomAttributes, forKey: SerializationKeys.crossexCognitoCustomAttributes)
        aCoder.encode(requestId, forKey: SerializationKeys.requestId)
        aCoder.encode(encryptRefreshToken, forKey: SerializationKeys.encryptRefreshToken)
        aCoder.encode(patientId, forKey: SerializationKeys.patientId)
        aCoder.encode(encryptIdToken, forKey: SerializationKeys.encryptIdToken)
        aCoder.encode(expSession, forKey: SerializationKeys.expSession)
        aCoder.encode(idToken, forKey: SerializationKeys.idToken)
        aCoder.encode(encryptAccessToken, forKey: SerializationKeys.encryptAccessToken)
        aCoder.encode(refreshToken, forKey: SerializationKeys.refreshToken)
        aCoder.encode(accessToken, forKey: SerializationKeys.accessToken)
        aCoder.encode(personProfile, forKey: SerializationKeys.personProfile)
        aCoder.encode(crossexProfile, forKey: SerializationKeys.crossexProfile)
        aCoder.encode(expIdToken, forKey: SerializationKeys.expIdToken)
        aCoder.encode(expAccessToken, forKey: SerializationKeys.expAccessToken)
    }
    
}
