//
//  Parent.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 12/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class Parent: NSObject, Mappable, NSCoding{
   
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let children = "children"
        static let name = "name"
        static let email = "email"
        static let mobile = "mobile"
        static let gender = "gender"
        static let relation = "relation"
        static let aadhaar = "aadhaar"
        static let lastName = "last_name"
        static let id = "id"
        static let firstName = "first_name"
        static let middleName = "middle_name"
        static let dob = "dob"
        static let photo = "photo"
        static let interests = "interests"
        static let address = "address"
        static let profession = "profession"
        static let bobID = "bob_id"
        
        
    }
  
    // MARK: Properties
    public var children: [Children]?
    public var name: String?
    public var email: String?
    public var mobile: Int?
    public var gender:String?
    public var relation: String?
    public var aadhaar: Int?
    public var lastName: String?
    public var id: Int?
    public var firstName: String?
    public var middleName: String?
    public var dob: String?
    public var photo: String?
    public var interests: [Interest]?
    public var address: Address?
    public var profession: String?
    public var bobID: String?

    
    var isAddressEmpty:Bool{
        var completeAddressArray = [Any]()
        completeAddressArray.append(address?.city as Any)
        completeAddressArray.append(address?.country as Any)
        completeAddressArray.append(address?.line1 as Any)
        completeAddressArray.append(address?.line2 as Any)
        completeAddressArray.append(address?.longitude as Any)
        completeAddressArray.append(address?.latitude as Any)
        completeAddressArray.append(address?.state as Any)
        completeAddressArray.append(address?.pincode as Any)

        let completeAddress = completeAddressArray.flatMap { (component) -> String? in
            return component as? String
        }
        return completeAddress.count == 0
    }
    
    var parentGender:Gender?{
        if let gender  = gender{
            return Gender(rawValue: gender)
        }
        return nil
    }
    
    var parentPlaceholderImage:UIImage?{
        if parentGender == .Male{
            return UIImage(named: "dadPlaceholder")
        }else if parentGender == .Female{
            return UIImage(named: "momPlaceholder")
        }else{
            return nil
        }
    }
    
    public var parentImage:UIImage?{
        let imageView = UIImageView()
        var imageUrl: String?
        if let partialUrl = photo {
            imageUrl = partialUrl.blossomImageUrl
        }
        ImageDownloadManager.imageDownloadManager.setAsyncImage(fromPartialURLPath: imageUrl, placeholderImage: parentPlaceholderImage, to: imageView, useTag: nil, placeholderFillColor: Colors.athensGray.color)
        return imageView.image
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
        
        self.children  = aDecoder.decodeObject(forKey: SerializationKeys.children) as? [Children]
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.gender  = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
        self.email  = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
        self.relation  = aDecoder.decodeObject(forKey: SerializationKeys.relation) as? String
        self.aadhaar  = aDecoder.decodeObject(forKey: SerializationKeys.aadhaar) as? Int
        self.lastName  = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.firstName  = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
        self.mobile  = aDecoder.decodeObject(forKey: SerializationKeys.mobile) as? Int

        self.middleName  = aDecoder.decodeObject(forKey: SerializationKeys.middleName) as? String
        self.dob  = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
        self.photo  = aDecoder.decodeObject(forKey: SerializationKeys.photo) as? String
        self.interests  = aDecoder.decodeObject(forKey: SerializationKeys.interests) as? [Interest]
        self.address  = aDecoder.decodeObject(forKey: SerializationKeys.address) as? Address
        self.profession  = aDecoder.decodeObject(forKey: SerializationKeys.profession) as? String
        self.bobID  = aDecoder.decodeObject(forKey: SerializationKeys.bobID) as? String

    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.children, forKey: SerializationKeys.children)
        aCoder.encode(self.name, forKey: SerializationKeys.name)
        aCoder.encode(self.gender, forKey: SerializationKeys.gender)
        aCoder.encode(self.email, forKey: SerializationKeys.email)
        aCoder.encode(self.relation, forKey: SerializationKeys.relation)
        aCoder.encode(self.aadhaar, forKey: SerializationKeys.aadhaar)
        aCoder.encode(self.lastName, forKey: SerializationKeys.lastName)
        aCoder.encode(self.id, forKey: SerializationKeys.id)
        aCoder.encode(self.firstName, forKey: SerializationKeys.firstName)
        aCoder.encode(self.middleName, forKey: SerializationKeys.middleName)
        aCoder.encode(self.dob, forKey: SerializationKeys.dob)
        aCoder.encode(self.mobile, forKey: SerializationKeys.mobile)
        aCoder.encode(self.photo, forKey: SerializationKeys.photo)
        aCoder.encode(self.interests, forKey: SerializationKeys.interests)
        aCoder.encode(self.address, forKey: SerializationKeys.address)
        aCoder.encode(self.profession, forKey: SerializationKeys.profession)
        aCoder.encode(self.bobID, forKey: SerializationKeys.bobID)

    }
    
    public func mapping(map: Map) {
        
        self.children <- map[SerializationKeys.children]
        self.name <- map[SerializationKeys.name]
        self.email <- map[SerializationKeys.email]
        self.mobile <- map[SerializationKeys.mobile]
        self.relation <- map[SerializationKeys.relation]
        self.aadhaar <- map[SerializationKeys.aadhaar]
        self.lastName <- map[SerializationKeys.lastName]
        self.firstName <- map[SerializationKeys.firstName]
        self.id <- map[SerializationKeys.id]
        self.firstName <- map[SerializationKeys.firstName]
        self.middleName <- map[SerializationKeys.middleName]
        self.dob <- map[SerializationKeys.dob]
        self.gender <- map[SerializationKeys.gender]
        self.photo <- map[SerializationKeys.photo]
        self.interests <- map[SerializationKeys.interests]
        self.address <- map[SerializationKeys.address]
        self.profession <- map[SerializationKeys.profession]
        self.bobID <- map[SerializationKeys.bobID]

    }

}

extension Parent{
    
    var firstChild:Children{
        return (self.children?.first)!
    }
    
    func isChildCreated() ->Bool {
        if let childrens = self.children{
            return childrens.count > 0
        }
        return false
    }
}
