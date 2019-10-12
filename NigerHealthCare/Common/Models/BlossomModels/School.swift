
import UIKit
import ObjectMapper

public class School:NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let name = "name"
        static let location = "location"
    }
    
    // MARK: Properties
    public var id: Int?
    public var name: String?
    public var location: String?
    
    public required  init?(map: Map) { }
    
    public func mapping(map: Map) {
        self.id <- map[SerializationKeys.id]
        self.name <- map[SerializationKeys.name]
        self.location <- map[SerializationKeys.location]
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.name  = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        self.location  = aDecoder.decodeObject(forKey: SerializationKeys.location) as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: SerializationKeys.id)
        aCoder.encode(self.name, forKey: SerializationKeys.name)
        aCoder.encode(self.location, forKey: SerializationKeys.location)
    }
}
