//
//  Programs.swift
//
//  Created by Shivam Dhingra on 01/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Programs: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kProgramsSubscriptionKey: String = "subscription"
	internal let kProgramsProgramKey: String = "program"


    // MARK: Properties
	public var subscription: Subscription?
	public var program: Program?



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		subscription <- map[kProgramsSubscriptionKey]
		program <- map[kProgramsProgramKey]

    }

}
