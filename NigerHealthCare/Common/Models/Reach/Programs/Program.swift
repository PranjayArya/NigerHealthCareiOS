//
//  Program.swift
//
//  Created by Shivam Dhingra on 01/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Program: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kProgramInternalIdentifierKey: String = "id"
	internal let kProgramTitleKey: String = "title"


    // MARK: Properties
	public var internalIdentifier: String?
	public var title: String?



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
		internalIdentifier <- map[kProgramInternalIdentifierKey]
		title <- map[kProgramTitleKey]

    }

}
