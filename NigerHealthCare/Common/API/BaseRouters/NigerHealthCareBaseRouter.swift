//
//  BaseRouter.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum RequestType {
    case dev, prod

    var urlString: String {

        switch self {
        case .dev:
            return APIConstants.NigerHealthCare.baseURL
        case .prod:
            return APIConstants.Reach.baseURLS
        }
    }
}

enum NigerHealthCareBaseRouter:URLRequestConvertible{
    
    case nigerHealthCareRouterManager(NigerHealthCareRouter)
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .nigerHealthCareRouterManager(let request):
            let mutableURLRequest = configureRequest(request)
            return mutableURLRequest
        }
    }
    
    
    func configureRequest(_ requestObj: BaseRouterProtocol, requestType: RequestType? = RequestType.dev) -> URLRequest {
        
        let url = URL(string: (requestType?.urlString)!)!
        
        /// Set Request Path
        var mutableURLRequest = URLRequest(url: url.appendingPathComponent(requestObj.path))
        
        /**
         *  Set Request Method
         */
        mutableURLRequest.httpMethod = requestObj.method.rawValue
        //Set Request Headers
        
        //Common headers
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
     
        // mutableURLRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //mutableURLRequest.setValue(HeaderConstants.application, forHTTPHeaderField: "X-Application")
        //Specific headers
        if let headers = requestObj.headers {
            for (key, value) in headers {
                mutableURLRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        /**
         *  Set Request Body if Method is POST or PUT
         */
        if requestObj.method == Alamofire.HTTPMethod.post || requestObj.method == Alamofire.HTTPMethod.get || requestObj.method == Alamofire.HTTPMethod.put {
            if let body = requestObj.body {
                if let mappableBody = body as? Mappable {
                    mutableURLRequest.httpBody = mappableBody.toJSONString()!.data(using: String.Encoding.utf8)
                } else {
                    do {
                        mutableURLRequest.httpBody =
                            try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    } catch {
                    }
                }
            }
        }
        //// Set Request Parameters.
        if let parameters: Alamofire.Parameters = requestObj.parameters {
            do {
                return try Alamofire.URLEncoding.queryString.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
            } catch {
                print(error)
            }
        }
        return mutableURLRequest
    }
}


enum NigerHealthCareBaseFormRouter:URLRequestConvertible{
    
    case nigerHealthCareRouterManager(NigerHealthCareRouter)
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .nigerHealthCareRouterManager(let request):
            let mutableURLRequest = configureRequest(request)
            return mutableURLRequest
        }
    }
    
    
    func configureRequest(_ requestObj: BaseRouterProtocol, requestType: RequestType? = RequestType.dev) -> URLRequest {
        
        let url = URL(string: (requestType?.urlString)!)!
        
        /// Set Request Path
        var mutableURLRequest = URLRequest(url: url.appendingPathComponent(requestObj.path))
        
        /**
         *  Set Request Method
         */
        mutableURLRequest.httpMethod = requestObj.method.rawValue
        //Set Request Headers
        
        //Common headers
         mutableURLRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //mutableURLRequest.setValue(HeaderConstants.application, forHTTPHeaderField: "X-Application")
        //Specific headers
        if let headers = requestObj.headers {
            for (key, value) in headers {
                mutableURLRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        /**
         *  Set Request Body if Method is POST or PUT
         */
        if requestObj.method == Alamofire.HTTPMethod.post || requestObj.method == Alamofire.HTTPMethod.get || requestObj.method == Alamofire.HTTPMethod.put {
            if let body = requestObj.body {
                if let mappableBody = body as? Mappable {
                    mutableURLRequest.httpBody = mappableBody.toJSONString()!.data(using: String.Encoding.utf8)
    
                } else {
                    do {
                        mutableURLRequest.httpBody =
                            try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    } catch {
                    }
                }
            }
        }
        //// Set Request Parameters.
        if let parameters: Alamofire.Parameters = requestObj.parameters {
            do {
                return try Alamofire.URLEncoding.queryString.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
            } catch {
                print(error)
            }
        }
        return mutableURLRequest
    }
}



extension Request {
    public func debugLog() -> Self {

        print("===============")
        print(self)
        print("Headers ---> ")
        print(self.request!.allHTTPHeaderFields ?? "")
        print("Body ---> ")
        if let requestBody = self.request?.httpBody {
            print(NSString(data: requestBody, encoding: String.Encoding.utf8.rawValue) ?? "")
        }
        print("===============")

        return self
    }
}
