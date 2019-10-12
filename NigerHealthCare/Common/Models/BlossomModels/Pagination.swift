//
//  Pagination.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 17/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import Foundation
import ObjectMapper

public class Pagination: Mappable{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let total = "total"
        static let lastPage = "last_page"
        static let perPage = "per_page"
        static let nextPageUrl = "next_page_url"
        static let currentPage = "current_page"
    }
    
    // MARK: Properties
    public var total: Int?
    public var lastPage: Int?
    public var perPage: Int?
    public var nextPageUrl: String?
    public var currentPage: Int?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.total <- map[SerializationKeys.total]
        self.lastPage <- map[SerializationKeys.lastPage]
        self.perPage <- map[SerializationKeys.perPage]
        self.nextPageUrl <- map[SerializationKeys.nextPageUrl]
        self.currentPage <- map[SerializationKeys.currentPage]
            
    }
}
