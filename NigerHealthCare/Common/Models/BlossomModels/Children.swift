//
//  Child.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 17/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper


public class FoodPivot:NSObject, Mappable, NSCoding{

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let foodID = "food_id"
        static let childID = "child_id"
    }
    
    // MARK: Properties
    public var foodID: Int?
    public var childID: String?
   
    public required  init?(map: Map) { }
    
    public required init?(coder aDecoder: NSCoder) {
        self.foodID  = aDecoder.decodeObject(forKey: SerializationKeys.foodID) as? Int
        self.childID  = aDecoder.decodeObject(forKey: SerializationKeys.childID) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.foodID, forKey: SerializationKeys.foodID)
        aCoder.encode(self.childID, forKey: SerializationKeys.childID)
    }

    public func mapping(map: Map) {
        self.foodID <- map[SerializationKeys.foodID]
        self.childID <- map[SerializationKeys.childID]
    }
}
public class Food:NSObject, Mappable, NSCoding{
    
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
    public var pivot: FoodPivot?
    public var isSelected: Bool = false

    public override init() {
        super.init()
    }
    
    public required  init?(map: Map) { }
    
    convenience init(fromTerminology terminology:Terminology) {
        self.init()
        self.id = terminology.id
        self.descriptionValue = terminology.descriptionValue
        self.name = terminology.name
        self.pivot = FoodPivot(JSON: [:])
    }


    public required init?(coder aDecoder: NSCoder) {
        
        self.descriptionValue  = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pivot  = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? FoodPivot
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

public class PlacePivot:NSObject, Mappable, NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let placeID = "place_id"
        static let childID = "child_id"
    }
    
    // MARK: Properties
    public var placeID: Int?
    public var childID: Int?
    
    public required  init?(map: Map) { }
  
    public required init?(coder aDecoder: NSCoder) {
        self.placeID  = aDecoder.decodeObject(forKey: SerializationKeys.placeID) as? Int
        self.childID  = aDecoder.decodeObject(forKey: SerializationKeys.childID) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.placeID, forKey: SerializationKeys.placeID)
        aCoder.encode(self.childID, forKey: SerializationKeys.childID)
    }
    
    public func mapping(map: Map) {
        self.placeID <- map[SerializationKeys.placeID]
        self.childID <- map[SerializationKeys.childID]
    }
}

public class Place:NSObject, Mappable, NSCoding{
    
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
    public var pivot: PlacePivot?
    public var isSelected: Bool = false

    public override init() {
        super.init()
    }

    public required  init?(map: Map) { }

    convenience init(fromTerminology terminology:Terminology) {
        self.init()
        self.id = terminology.id
        self.descriptionValue = terminology.descriptionValue
        self.name = terminology.name
        self.pivot = PlacePivot(JSON: [:])
    }

    public required init?(coder aDecoder: NSCoder) {
        
        self.descriptionValue  = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pivot  = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? PlacePivot
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

public class ActivityPivot:NSObject, Mappable, NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let activityID = "activity_id"
        static let childID = "child_id"
    }
    
    // MARK: Properties
    public var activityID: Int?
    public var childID: Int?
    
    public required  init?(map: Map) { }

    public required init?(coder aDecoder: NSCoder) {
        
        self.activityID  = aDecoder.decodeObject(forKey: SerializationKeys.activityID) as? Int
        self.childID  = aDecoder.decodeObject(forKey: SerializationKeys.childID) as? Int
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.activityID, forKey: SerializationKeys.activityID)
        aCoder.encode(self.childID, forKey: SerializationKeys.childID)        
    }
    
    public func mapping(map: Map) {
        self.activityID <- map[SerializationKeys.activityID]
        self.childID <- map[SerializationKeys.childID]
    }
}

public class BlossomActivity:NSObject, Mappable, NSCoding{
    
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
    public var pivot: ActivityPivot?
    public var isSelected: Bool = false

    public override init() {
        super.init()
    }
    
    public required  init?(map: Map) { }
    
    convenience init(fromTerminology terminology:Terminology) {
        self.init()
        self.id = terminology.id
        self.descriptionValue = terminology.descriptionValue
        self.name = terminology.name
        self.pivot = ActivityPivot(JSON: [:])
    }

    public required init?(coder aDecoder: NSCoder) {
        
        self.descriptionValue  = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pivot  = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? ActivityPivot
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

public class Children:NSObject, Mappable, NSCoding{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let motherMaidenName = "mother_maiden_name"
        static let name = "name"
        static let gender = "gender"
        static let favoriteColor = "favorite_color"
        static let primaryParentId = "primary_parent_id"
        static let placeOfBirth = "place_of_birth"
        static let lastName = "last_name"
        static let id = "id"
        static let firstName = "first_name"
        static let photo = "photo"
        static let bloodGroup = "blood_group"
        static let middleName = "middle_name"
        static let dob = "dob"
        static let activities = "activities"
        static let documents = "documents"
        static let foods = "foods"
        static let places = "places"
        static let school = "school_listing"

    }
    
    // MARK: Properties
    public var motherMaidenName: String?
    public var name: String?
    public var gender: String?
    public var favoriteColor: String?
    public var primaryParentId: Int?
    public var placeOfBirth: String?
    public var lastName: String?
    public var id: String?
    public var firstName: String?
    public var photo: String?
    public var bloodGroup: String?
    public var middleName: String?
    public var dob: String?
    public var activities: [BlossomActivity]?
    public var documents: [Document]?
    public var foods: [Food]?
    public var places: [Place]?
    public var school:School?
    
    var childGender:Gender?{
        if let gender  = gender{
            return Gender(rawValue: gender)
        }
        return nil
    }
    
    var childPlaceholderImage:UIImage?{
        if childGender == .Male{
            return UIImage(named: "profile_default")
        }else{
            return UIImage(named: "profile_default")
        }
    }
    
    public var fullName: String!{
      return name ?? ""
    }
    
    public var childName: String!{
        var nameComponents = [Any]()
        nameComponents.append(firstName as Any)
        nameComponents.append(lastName as Any)
        let name  = nameComponents.compactMap { (nameComponents) -> String? in
            return nameComponents as? String
        }
        return name.joined(separator: " ")
    }

    var dobDate:Date?{
        if let dob = dob {
            return Date(fromString: dob, format: Constants.Date.serverDateFormat)
        }
        return nil
    }
    
    public required init?(map: Map) {
    }
    
    public required init?(coder aDecoder: NSCoder) {
       
        self.motherMaidenName  = aDecoder.decodeObject(forKey: SerializationKeys.motherMaidenName) as? String
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.gender  = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
        self.favoriteColor  = aDecoder.decodeObject(forKey: SerializationKeys.favoriteColor) as? String
        self.primaryParentId  = aDecoder.decodeObject(forKey: SerializationKeys.primaryParentId) as? Int
        self.placeOfBirth  = aDecoder.decodeObject(forKey: SerializationKeys.placeOfBirth) as? String
        self.lastName  = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
        self.firstName  = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
        self.photo  = aDecoder.decodeObject(forKey: SerializationKeys.photo) as? String
        self.bloodGroup  = aDecoder.decodeObject(forKey: SerializationKeys.bloodGroup) as? String
        self.middleName  = aDecoder.decodeObject(forKey: SerializationKeys.middleName) as? String
        self.dob  = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
        
        self.activities  = aDecoder.decodeObject(forKey: SerializationKeys.activities) as? [BlossomActivity]
        self.documents  = aDecoder.decodeObject(forKey: SerializationKeys.documents) as? [Document]
        self.foods  = aDecoder.decodeObject(forKey: SerializationKeys.foods) as? [Food]
        self.places  = aDecoder.decodeObject(forKey: SerializationKeys.places) as? [Place]
        self.school = aDecoder.decodeObject(forKey: SerializationKeys.school) as? School
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.motherMaidenName, forKey: SerializationKeys.motherMaidenName)
        aCoder.encode(self.name, forKey: SerializationKeys.name)
        aCoder.encode(self.gender, forKey: SerializationKeys.gender)
        aCoder.encode(self.favoriteColor, forKey: SerializationKeys.favoriteColor)
        aCoder.encode(self.primaryParentId, forKey: SerializationKeys.primaryParentId)
        aCoder.encode(self.placeOfBirth, forKey: SerializationKeys.placeOfBirth)
        aCoder.encode(self.lastName, forKey: SerializationKeys.lastName)
        aCoder.encode(self.id, forKey: SerializationKeys.id)
        aCoder.encode(self.firstName, forKey: SerializationKeys.firstName)
        aCoder.encode(self.photo, forKey: SerializationKeys.photo)
        aCoder.encode(self.bloodGroup, forKey: SerializationKeys.bloodGroup)
        aCoder.encode(self.middleName, forKey: SerializationKeys.middleName)
        aCoder.encode(self.dob, forKey: SerializationKeys.dob)
     
        aCoder.encode(self.activities, forKey: SerializationKeys.activities)
        aCoder.encode(self.documents, forKey: SerializationKeys.documents)
        aCoder.encode(self.foods, forKey: SerializationKeys.foods)
        aCoder.encode(self.places, forKey: SerializationKeys.places)
        aCoder.encode(self.school, forKey: SerializationKeys.school)

    }
    
    public func mapping(map: Map) {
        
        self.motherMaidenName <- map[SerializationKeys.motherMaidenName]
        self.name <- map[SerializationKeys.name]
        self.gender <- map[SerializationKeys.gender]
        self.favoriteColor <- map[SerializationKeys.favoriteColor]
        self.primaryParentId <- map[SerializationKeys.primaryParentId]
        self.placeOfBirth <- map[SerializationKeys.placeOfBirth]
        self.lastName <- map[SerializationKeys.lastName]
        self.id <- map[SerializationKeys.id]
        self.firstName <- map[SerializationKeys.firstName]
        self.photo <- map[SerializationKeys.photo]
        self.bloodGroup <- map[SerializationKeys.bloodGroup]
        self.middleName <- map[SerializationKeys.middleName]
        self.dob <- map[SerializationKeys.dob]
        self.activities <- map[SerializationKeys.activities]
        self.documents <- map[SerializationKeys.documents]
        self.foods <- map[SerializationKeys.foods]
        self.places <- map[SerializationKeys.places]
        self.school <- map[SerializationKeys.school]
    }
}
