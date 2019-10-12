//
//  Location.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 01/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

class Address: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let city = "city"
        static let state = "state"
        static let line1 = "line1"
        static let line2 = "line2"
        static let country = "country"
        static let pincode = "pincode"
        static let latitude = "latitude"
        static let longitude = "longitude"

    }
    
    // MARK: Properties
    public var city: String?
    public var state: String?
    public var line1: String?
    public var line2: String?
    public var country: String?
    public var pincode: Int?
    public var latitude: Double?
    public var longitude: Double?

    required init?(map: Map){
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.city  = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
        self.state  = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
        self.line1  = aDecoder.decodeObject(forKey: SerializationKeys.line1) as? String
        self.line2  = aDecoder.decodeObject(forKey: SerializationKeys.line2) as? String
        self.country  = aDecoder.decodeObject(forKey: SerializationKeys.country) as? String
        self.pincode  = aDecoder.decodeObject(forKey: SerializationKeys.pincode) as? Int
        self.latitude  = aDecoder.decodeObject(forKey: SerializationKeys.latitude) as? Double
        self.longitude  = aDecoder.decodeObject(forKey: SerializationKeys.longitude) as? Double
        
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.city, forKey: SerializationKeys.city)
        aCoder.encode(self.state, forKey: SerializationKeys.state)
        aCoder.encode(self.line1, forKey: SerializationKeys.line1)
        aCoder.encode(self.line2, forKey: SerializationKeys.line2)
        aCoder.encode(self.country, forKey: SerializationKeys.country)
        aCoder.encode(self.pincode, forKey: SerializationKeys.pincode)
        aCoder.encode(self.latitude, forKey: SerializationKeys.latitude)
        aCoder.encode(self.longitude, forKey: SerializationKeys.longitude)
        
    }
    
    func mapping(map: Map) {
        city <- map[SerializationKeys.city]
        state <- map[SerializationKeys.state]
        line1 <- map[SerializationKeys.line1]
        line2 <- map[SerializationKeys.line2]
        pincode <- map[SerializationKeys.pincode]
        country <- map[SerializationKeys.country]
        latitude <- map[SerializationKeys.latitude]
        longitude <- map[SerializationKeys.longitude]

    }
    
}

public class LocationPivot: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let doctorID = "doctor_id"
        static let locationID = "location_id"
        static let consultationFee = "consultation_fee"
        static let createdAt = "created_at"
        static let updatedAt = "updated_at"

    }
    
    // MARK: Properties
    public var doctorID: Int?
    public var locationID: Int?
    public var consultationFee: String?
    public var createdAt: String?
    public var updatedAt: String?

    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.doctorID <- map[SerializationKeys.doctorID]
        self.locationID <- map[SerializationKeys.locationID]
        self.consultationFee <- map[SerializationKeys.consultationFee]
        self.createdAt <- map[SerializationKeys.createdAt]
        self.updatedAt <- map[SerializationKeys.updatedAt]

    }
}

class Timing: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let timing = "timing"
        static let days = "days"
    }
    
    // MARK: Properties
    public var timing: String?
    public var days: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        timing <- map[SerializationKeys.timing]
        days <- map[SerializationKeys.days]
    }
    
    func isPresent() ->Bool {
        if ValidationUtils.isTextEmpty(days){
            return false
        }
        
        let daysArray = days!.split(",")
        let weekday = Date().weekday(dayStyle: .short)
        let timingsArray = timing?.split(" - ")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.locale = Locale(identifier:"en_US_POSIX")
        
        let calendar = Calendar.current
        let currentTimeComponents = calendar.dateComponents([.hour, .minute], from: Date())
        
        if daysArray.contains(weekday){
            if let timings = timingsArray, timings.count >= 2{
                let endTime =  formatter.date(from: timings[1])
                let endTimeComponents = calendar.dateComponents([.hour, .minute], from: endTime!)

                let currentDate = calendar.date(from:currentTimeComponents)
                let endDate = calendar.date(from:endTimeComponents)

                if currentDate?.compare(endDate!) == ComparisonResult.orderedAscending{
                    return true
                }
                
            }
        }
        
        return false
    }

}

class LocationType: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let type = "type"
        static let descriptionValue = "description"
    }
    
    // MARK: Properties
    public var id: Int?
    public var type: String?
    public var descriptionValue: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map[SerializationKeys.id]
        type <- map[SerializationKeys.type]
        descriptionValue <- map[SerializationKeys.descriptionValue]
    }
    
}

class Location: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let email = "email"
        static let id = "id"
        static let availableToBook = "available_to_book"
        static let pivot = "pivot"
        static let address = "address"
        static let descriptionValue = "description"
        static let website = "website"
        static let timings = "timings"
        static let tagline = "tagline"
        static let locationType = "location_type"
        static let contacts = "contacts"
        static let catalogs = "catalogs"
    }
    
    // MARK: Properties
    public var name: String?
    public var email: String?
    public var id: Int?
    public var availableToBook: Bool? = false
    public var pivot: LocationPivot?
    public var address: Address?
    public var descriptionValue: String?
    public var website: String?
    public var timings: [Timing]?
    public var tagline: String?
    public var locationType: LocationType?
    public var contacts:[BlossomContact]?
    public var catalogs:[Catalogs]?
    
    public var fullAddress: String?{
        var addresses = [Any]()
        addresses.append(name as Any)
        addresses.append(address?.line1 as Any)
        addresses.append(address?.line2 as Any)
        addresses.append(address?.city as Any)
        addresses.append(address?.state as Any)
        let addressArray = addresses.flatMap { (addressComponent) -> String? in
            return addressComponent as? String
        }
        return addressArray.joined(separator: ", ")
    }
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        name <- map[SerializationKeys.name]
        email <- map[SerializationKeys.email]
        id <- map[SerializationKeys.id]
        availableToBook <- map[SerializationKeys.availableToBook]
        pivot <- map[SerializationKeys.pivot]
        address <- map[SerializationKeys.address]
        descriptionValue <- map[SerializationKeys.descriptionValue]
        website <- map[SerializationKeys.website]
        timings <- map[SerializationKeys.timings]
        tagline <- map[SerializationKeys.tagline]
        locationType <- map[SerializationKeys.locationType]
        contacts <- map[SerializationKeys.contacts]
        catalogs <- map[SerializationKeys.catalogs]
    }
    
    func catalogueByID(id:Int) -> Catalogs?{
        let catalogues = catalogs?.filter({ (catalog) -> Bool in
            return catalog.catalogService?.id == id
        })
        return catalogues?.first
    }
    
    func isAvaiable() -> Bool {
        if (timings == nil){
            return false
        }
        for timing in timings!{
            if timing.isPresent(){
                return true
            }
        }
        return false;
    }
    
}
