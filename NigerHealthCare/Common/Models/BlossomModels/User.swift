//
//  User.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 17/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper

//MARK: - Enum
public enum Gender:String{
    case Male = "male", Female = "female", unknown = "", Other = "other"
}

public class Me: Mappable{
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let lastLogin = "last_login"
        static let userTypes = "user_types"
        static let mobile = "mobile"
        static let countryCodeId = "country_code_id"
        static let id = "id"
        static let firstName = "first_name"
        static let middleName = "middle_name"
        static let lastName = "last_name"
        static let dob = "dob"
        static let gender = "gender"
        static let email = "email"
        static let photo = "photo"
        static let aadhaar = "aadhaar"
        static let passwordChangedAt = "password_changed_at"
        static let emailVerified = "email_verified"
        static let bobID = "bob_id"

    }
    
    // MARK: Properties
    public var lastLogin: String?
    public var userTypes: [UserType]?
    public var mobile: Int?
    public var countryCodeId: Int?
    public var id: Int?
    public var firstName: String?
    public var middleName: String?
    public var lastName: String?
    public var dob: String?
    public var gender: String?
    public var email: String?
    public var photo: String?
    public var aadhaar: Int?
    public var password: String?
    public var passwordChangedAt: String?
    public var emailVerified: Bool?
    public var bobID: String?

    public var relation: String?{
        if userGender == Gender.Male{
            return "Father"
        }else{
            return  "Mother"
        }
    }

    public var userGender: Gender{
        if self.gender != nil{
            return Gender(rawValue: gender!)!
        }
        return Gender.unknown
    }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        self.lastLogin <- map[SerializationKeys.lastLogin]
        self.userTypes <- map[SerializationKeys.userTypes]
        self.mobile <- map[SerializationKeys.mobile]
        self.countryCodeId <- map[SerializationKeys.countryCodeId]
        self.id <- map[SerializationKeys.id]
        self.firstName <- map[SerializationKeys.firstName]
        self.middleName <- map[SerializationKeys.middleName]
        self.lastName <- map[SerializationKeys.lastName]
        self.dob <- map[SerializationKeys.dob]
        self.email <- map[SerializationKeys.email]
        self.photo <- map[SerializationKeys.photo]
        self.aadhaar <- map[SerializationKeys.aadhaar]
        self.passwordChangedAt <- map[SerializationKeys.passwordChangedAt]
        self.gender <- map[SerializationKeys.gender]
        self.emailVerified <- map[SerializationKeys.emailVerified]
        self.bobID <- map[SerializationKeys.bobID]

    }
}

public class UserResponseData: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let tokenType = "token_type"
        static let accessToken = "access_token"
        static let me = "me"
    }
    
    // MARK: Properties
    public var tokenType: String?
    public var accessToken: String?
    public var me: Me?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.tokenType <- map[SerializationKeys.tokenType]
        self.accessToken <- map[SerializationKeys.accessToken]
        self.me <- map[SerializationKeys.me]
    }
}

public class User: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let pagination = "pagination"
        static let status = "status"
        static let data = "data"
        static let resource = "resource"
        static let message = "message"
        static let timestamp = "timestamp"
        static let httpCode = "http_code"
    }
    
    // MARK: Properties
    public var pagination: Pagination?
    public var status: String?
    public var data: UserResponseData?
    public var resource: String?
    public var message: String?
    public var timestamp: String?
    public var httpCode: Int?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.pagination <- map[SerializationKeys.pagination]
        self.status <- map[SerializationKeys.status]
        self.data <- map[SerializationKeys.data]
        self.resource <- map[SerializationKeys.resource]
        self.message <- map[SerializationKeys.message]
        self.timestamp <- map[SerializationKeys.timestamp]
        self.httpCode <- map[SerializationKeys.httpCode]
        
    }
    
    static func convertParentObjcIntoUser(parent:Parent) -> User{
        let user = User(JSON: [:])
        user?.data = UserResponseData(JSON: [:])
        user?.data?.me = Me(JSON: [:])
        
        user?.data?.me?.mobile = parent.mobile
        user?.data?.me?.gender = parent.gender
        user?.data?.me?.firstName = parent.firstName
        user?.data?.me?.lastName = parent.lastName
        user?.data?.me?.middleName = parent.middleName
        user?.data?.me?.dob = parent.dob
        user?.data?.me?.aadhaar = parent.aadhaar
        user?.data?.me?.email = parent.email
        user?.data?.me?.bobID = parent.bobID
        user?.data?.me?.photo = parent.photo
        return user!
    }
}

extension User{
    
    var parentID:Int {
        return self.data?.me?.userTypes?.first?.pivot?.roleReferenceId ?? 0
    }
    
    func isParentCreated() ->Bool {
        if let userTypes = self.data?.me?.userTypes{
            let types = userTypes.filter({ (userType) -> Bool in
                return userType.pivot?.roleReferenceId != nil &&  userType.type == "PARENT"
            })
            return types.count > 0
        }
        return false
    }

}
