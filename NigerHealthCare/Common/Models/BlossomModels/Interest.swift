//
//  Interest.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 24/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

public class InterestPivot:NSObject, Mappable, NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let interestID = "interest_id"
        static let parentID = "parent_id"
    }
    
    // MARK: Properties
    public var interestID: Int?
    public var parentID: Int?
    
    public required  init?(map: Map) { }
    
    public required init?(coder aDecoder: NSCoder) {
        self.interestID  = aDecoder.decodeObject(forKey: SerializationKeys.interestID) as? Int
        self.parentID  = aDecoder.decodeObject(forKey: SerializationKeys.parentID) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.interestID, forKey: SerializationKeys.interestID)
        aCoder.encode(self.parentID, forKey: SerializationKeys.parentID)
    }
    
    public func mapping(map: Map) {
        self.interestID <- map[SerializationKeys.interestID]
        self.parentID <- map[SerializationKeys.parentID]
    }
}

public class Interest:NSObject, Mappable, NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let descriptionValue = "description"
        static let name = "name"
        static let id = "id"
        static let pivot = "pivot"
    }
    
    // MARK: Properties
    public var descriptionValue: String?
    public var name: String?
    public var id: Int?
    public var pivot: InterestPivot?
    public var isSelected: Bool = false

    public override init() {
        super.init()
    }
    
    convenience public required init?(map: Map) {
        self.init()
    }
    
    convenience init(fromTerminology terminology:Terminology) {
        self.init()
        self.id = terminology.id
        self.descriptionValue = terminology.descriptionValue
        self.name = terminology.name
        self.pivot = InterestPivot(JSON: [:])
    }

    public required init?(coder aDecoder: NSCoder) {
        
        self.descriptionValue  = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pivot  = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? InterestPivot
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(self.name, forKey: SerializationKeys.name)
        aCoder.encode(self.id, forKey: SerializationKeys.id)
        aCoder.encode(self.pivot, forKey: SerializationKeys.pivot)
        
    }
    
    public func mapping(map: Map) {
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.name <- map[SerializationKeys.name]
        self.id <- map[SerializationKeys.id]
        self.pivot <- map[SerializationKeys.pivot]
    }
}
