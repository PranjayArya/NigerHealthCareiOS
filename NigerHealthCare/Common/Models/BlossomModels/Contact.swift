//
//  Contact.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 06/09/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class ContactPivot: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let contactable_id = "contactable_id"
        static let contact_type_id = "contact_type_id"
        static let contact = "contact"
        static let primary = "primary"
        static let created_at = "created_at"
        static let updated_at = "updated_at"

    }
    
    // MARK: Properties
    public var contactable_id: Int?
    public var contact_type_id: Int?
    public var contact: String?
    public var primary: Bool?
    public var updated_at: String?
    public var created_at: String?

    public required  init?(map: Map) { }

    public func mapping(map: Map) {
        
        self.contactable_id <- map[SerializationKeys.contactable_id]
        self.contact_type_id <- map[SerializationKeys.contact_type_id]
        self.contact <- map[SerializationKeys.contact]
        self.primary <- map[SerializationKeys.primary]
        self.updated_at <- map[SerializationKeys.updated_at]
        self.created_at <- map[SerializationKeys.created_at]
    }

}

class BlossomContact: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let type = "type"
        static let descriptionValue = "description"
        static let pivot = "pivot"
    }
    
    // MARK: Properties
    public var id: Int?
    public var type: String?
    public var descriptionValue: String?
    public var pivot: ContactPivot?

    public required  init?(map: Map) { }
    
    public func mapping(map: Map) {
        self.id <- map[SerializationKeys.id]
        self.type <- map[SerializationKeys.type]
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.pivot <- map[SerializationKeys.pivot]
    }
    
}
