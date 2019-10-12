//
//  NetworkAdapter.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Alamofire
import Reachability

/*
 * Http Error Response Class to Handle all Http Specific Errors. Here this is inherited from NSError Class
 * and modified to suit our needs. It will take the statusCode, Server Error Code and Server Error
 * Description and will put it in code, domain and localizedDescription fields of NSError Class
 * accordingly.
 */

let networkAdapterErrorDomain = "com.blossom.networkadaptor"

public class HttpResponseError: NSError {

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Custom Initializer.
    ///
    /// - Parameters:
    ///   - statusCode: Http Status Code.
    ///   - serverErrorCode: Error Code sent from the server in response body.
    ///   - serverErrorDescription: Error Description sent from the server in response body.
    public init(domain: String?, statusCode: Int, serverErrorDescription: String?) {
        super.init(domain: domain != nil ? domain! : "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: serverErrorDescription != nil ? serverErrorDescription!: ""])
    }
}

/// Network Adapter for routing all the Requests. It is a wrapper around Alamofire Request method to provide custom hooks for the requests and response.

public class NetworkAdapter {
    private static var reachability =  Reachability()!

    public class func request(_ urlRequest: URLRequestConvertible,
                              completionHandler: @escaping (Any) -> Void,
                              errorHandler: @escaping (NSError) -> Void,
                              networkErrorHandler: () -> Void) {

        if reachability.connection != .none {
            Alamofire.request(urlRequest).validate().debugLog().responseJSON { (response) in
                guard response.result.isSuccess else {
                    errorHandler(self.handleErrorFor(response: response))
                    return
                }

                if let authToken  = response.response?.allHeaderFields["Lemon-Authorization"] as? String{
                    AuthUtils.setAccessToken(accessToken: authToken)
                }
                
                completionHandler(response.result.value!)
            }

        } else {
            networkErrorHandler()
        }
    }

    public class func requestForTextResponse(_ urlRequest: URLRequestConvertible,
                                             completionHandler: @escaping (Any) -> Void,
                                             errorHandler: @escaping (NSError) -> Void,
                                             networkErrorHandler: () -> Void) {

        if reachability.connection != .none {
            Alamofire.request(urlRequest).validate().debugLog().responseString { (response) in
                guard response.result.isSuccess else {
                    errorHandler(response.result.error! as NSError)
                    return
                }
                completionHandler(response.result.value!)
            }
        } else {
            networkErrorHandler()
        }
    }

    // Request Method to post form data to the Server.
    public class func requestWithFormParameters(_ urlRequest: URLRequestConvertible,
                                                parameters: [String: String],
                                                completionHandler: @escaping (Any) -> Void,
                                                errorHandler: @escaping (NSError) -> Void,
                                                networkErrorHandler: () -> Void) {
        if reachability.connection != .none {
            Alamofire.upload(multipartFormData: {(multipartFormData) in
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
                }
            }, with: urlRequest, encodingCompletion: { (result) in
                switch result {
                case .success(let upload, _, _):
                    upload.validate().debugLog().responseJSON(completionHandler: { (response) in
                        guard response.result.isSuccess else {
                            errorHandler(self.handleErrorFor(response: response))
                            return
                        }
                        completionHandler(response.result.value!)
                    })

                case .failure(let error):
                    errorHandler(error as NSError)
                }
            })
        } else {
            networkErrorHandler()
        }
    }

    /// Method to create and return HttpResponseError if error is encountered
    ///
    /// - Parameter response: Data Response received from the Server.
    /// - Returns: HttpResponseError Object.
    private class func handleErrorFor(response: DataResponse<Any>) -> HttpResponseError {
        var responseDictionary = [String: Any]()
        if let data = response.data {
            do {
                if let responseDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    responseDictionary = responseDict
                }
            } catch {
                print(error)
            }
        }
        if let errorDictionary = responseDictionary["error"] as? [String: Any] {
            return HttpResponseError(domain: networkAdapterErrorDomain, statusCode: response.response!.statusCode, serverErrorDescription: errorDictionary["description"] as? String)
        }
        if let message = responseDictionary["message"] as? String {
            return HttpResponseError(domain: networkAdapterErrorDomain, statusCode: response.response!.statusCode, serverErrorDescription: message)
        }
        if response.response != nil {
            return HttpResponseError(domain: networkAdapterErrorDomain, statusCode: response.response!.statusCode, serverErrorDescription: nil)
        } else {
            return HttpResponseError(domain: networkAdapterErrorDomain, statusCode: HTTPStatusCode.requestTimeout.rawValue, serverErrorDescription: nil)
        }
    }
}
