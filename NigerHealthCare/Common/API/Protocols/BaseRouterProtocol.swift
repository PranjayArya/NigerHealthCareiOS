//
//  BaseRouterProtocol.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import Alamofire

/**
 *  This Protocol Must be extended by all the Routers. Defines Path, Method, Parameters, Body
 */

public typealias RequestHeaders = [String: String]
public typealias RequestBody = [String: Any]
public typealias QueryParams = [String: Any]
public typealias PathParams = [String: Any]
public typealias ResponseObject = [String: Any]
public typealias ResponseArray = [[String: Any]]

protocol BaseRouterProtocol {

    var path: String { get }

    var method: Alamofire.HTTPMethod { get }

    var parameters: Alamofire.Parameters? { get }

    var body: AnyObject? { get }

    var headers: [String: String]? { get }
}
