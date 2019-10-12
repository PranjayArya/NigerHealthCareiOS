//
//  Subscription.swift
//
//  Created by Shivam Dhingra on 01/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Subscription: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSubscriptionEndDateKey: String = "endDate"
	internal let kSubscriptionInternalIdentifierKey: String = "id"
	internal let kSubscriptionStatusKey: String = "status"
	internal let kSubscriptionStartDateKey: String = "startDate"
	internal let kSubscriptionTypeKey: String = "type"


    // MARK: Properties
	public var endDate: String?
	public var internalIdentifier: String?
	public var status: String?
	public var startDate: String?
	public var type: Int?



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public required init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		endDate <- map[kSubscriptionEndDateKey]
		internalIdentifier <- map[kSubscriptionInternalIdentifierKey]
		status <- map[kSubscriptionStatusKey]
		startDate <- map[kSubscriptionStartDateKey]
		type <- map[kSubscriptionTypeKey]

    }

}
