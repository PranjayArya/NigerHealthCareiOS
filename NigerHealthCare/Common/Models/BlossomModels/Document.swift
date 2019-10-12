//
//  Document.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 22/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import ObjectMapper

public class DocumentPivot:NSObject, Mappable, NSCoding, NSCopying{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let documentableID = "documentable_id"
        static let childID = "child_id"
        static let documentTypeID = "document_type_id"
        static let document = "document"
        static let createdAt = "created_at"
        static let updatedAt = "updated_at"
        static let caption = "caption"
    }
    
    // MARK: Properties
    public var documentableID: Int?
    public var childID: Int?
    public var documentTypeID: Int?
    public var document: String?
    public var createdAt: String?
    public var updatedAt: String?
    public var caption: String?
    
    public required  init?(map: Map) { }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.documentableID  = aDecoder.decodeObject(forKey: SerializationKeys.documentableID) as? Int
        self.childID  = aDecoder.decodeObject(forKey: SerializationKeys.childID) as? Int
        self.documentTypeID  = aDecoder.decodeObject(forKey: SerializationKeys.documentTypeID) as? Int
        self.document  = aDecoder.decodeObject(forKey: SerializationKeys.document) as? String
        self.createdAt  = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        self.updatedAt  = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        self.caption  = aDecoder.decodeObject(forKey: SerializationKeys.caption) as? String
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.documentableID, forKey: SerializationKeys.documentableID)
        aCoder.encode(self.childID, forKey: SerializationKeys.childID)
        aCoder.encode(self.documentTypeID, forKey: SerializationKeys.documentTypeID)
        aCoder.encode(self.document, forKey: SerializationKeys.document)
        aCoder.encode(self.createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(self.updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(self.caption, forKey: SerializationKeys.caption)
        
    }
    
    public func mapping(map: Map) {
        self.documentableID <- map[SerializationKeys.documentableID]
        self.childID <- map[SerializationKeys.childID]
        self.documentTypeID <- map[SerializationKeys.documentTypeID]
        self.document <- map[SerializationKeys.document]
        self.createdAt <- map[SerializationKeys.createdAt]
        self.updatedAt <- map[SerializationKeys.updatedAt]
        self.caption <- map[SerializationKeys.caption]
    }
    
    
    init(documentableID: Int?, childID: Int?, documentTypeID: Int?, document: String?, createdAt: String?, updatedAt: String?, caption: String?) {
        self.documentableID = documentableID
        self.childID = childID
        self.documentTypeID = documentTypeID
        self.document = document
        self.caption = caption
        self.createdAt = createdAt
        self.updatedAt = updatedAt

    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = DocumentPivot(documentableID: documentableID, childID: childID, documentTypeID: documentTypeID, document: document, createdAt: createdAt, updatedAt: updatedAt, caption: caption)
        return copy
    }
}

public class Document:NSObject, Mappable, NSCoding, NSCopying{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let descriptionValue = "description"
        static let id = "id"
        static let type = "type"
        static let pivot = "pivot"
    }
    
    // MARK: Properties
    public var descriptionValue: String?
    public var id: Int?
    public var type: String?
    public var pivot: DocumentPivot?
    
    public override init() {
        super.init()
    }
    
    convenience public required init?(map: Map) {
        self.init()
    }
    
    convenience init(fromTerminology terminology:Terminology) {
        self.init()
        self.id = terminology.id
        self.pivot = DocumentPivot(JSON: [:])
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        self.descriptionValue  = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
        self.type  = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
        self.id  = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.pivot  = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? DocumentPivot
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.descriptionValue, forKey: SerializationKeys.descriptionValue)
        aCoder.encode(self.type, forKey: SerializationKeys.type)
        aCoder.encode(self.id, forKey: SerializationKeys.id)
        aCoder.encode(self.pivot, forKey: SerializationKeys.pivot)
    }
    
    public func mapping(map: Map) {
        self.descriptionValue <- map[SerializationKeys.descriptionValue]
        self.id <- map[SerializationKeys.id]
        self.type <- map[SerializationKeys.type]
        self.pivot <- map[SerializationKeys.pivot]
    }
    
    init(descriptionValue: String?, id: Int?, type: String?, pivot: DocumentPivot?) {
        self.descriptionValue = descriptionValue
        self.id = id
        self.pivot = pivot
        self.type = type
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = Document(descriptionValue: descriptionValue, id: id,type:type, pivot: pivot?.copy() as? DocumentPivot)
        return copy
    }

}
