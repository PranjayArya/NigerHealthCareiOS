//
//  UserType.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 16/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper

public class Pivot: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let userTypeId = "user_type_id"
        static let userId = "user_id"
        static let roleReferenceId = "role_reference_id"
    }
    
    // MARK: Properties
    public var userTypeId: Int?
    public var userId: Int?
    public var roleReferenceId: Int?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        self.userTypeId <- map[SerializationKeys.userTypeId]
        self.userId <- map[SerializationKeys.userId]
        self.roleReferenceId <- map[SerializationKeys.roleReferenceId]
    }
}

public class UserType: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let descriptionValue = "description"
        static let id = "id"
        static let app = "app"
        static let type = "type"
        static let pivot = "pivot"
    }

    
    // MARK: Properties
    public var descriptionValue: String?
    public var id: Int?
    public var app: String?
    public var type: String?
    public var pivot: Pivot?

    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.id <- map[SerializationKeys.id]
        self.app <- map[SerializationKeys.app]
        self.type <- map[SerializationKeys.type]
        self.pivot <- map[SerializationKeys.pivot]

    }
}
