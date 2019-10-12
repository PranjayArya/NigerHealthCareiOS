//
//  UploadManager.swift
//  rgconnectsdkframework
//
//  Created by Abhayam Rastogi on 06/01/18.
//  Copyright © 2018 RoundGlass Partners. All rights reserved.
//

import Foundation
import Alamofire

public class FileUpload {
    public var name: String!
    public var size: Int!
    public var type: String!
    public var data: Data!
    
    public init(name:String, size:Int, type:String, data:Data) {
        self.name = name
        self.size = size
        self.type = type
        self.data = data
    }
}

public class UploadManager {
    
    public static let shared = UploadManager()
    
    func uploadImageWithRequestBody(file: Data, imageKey:String, uploadURL: String, body : [String:String], headers: [String: String], successCallback: @escaping ((_ media: JSON?) -> Void),
                                    errorCallback: @escaping ((_ error: Error) -> Void),
                                    networkCallback: @escaping (() -> Void)) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key, value) in body {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
                multipartFormData.append(file, withName: imageKey, fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
            
        }, to: uploadURL, method: .post, headers: headers) { encodingResult in
            
            switch encodingResult {
            case .success(let uploadRequest, _, _):
                
                uploadRequest.validate().debugLog().responseJSON(completionHandler: { response in
                    guard response.result.isSuccess else {
                        errorCallback(response.result.error!)
                        return
                    }
                    print(response)
                    
                    guard let responseJSON = response.value as? JSON else {
                        errorCallback(response.result.error!)
                        return
                    }
                    
                    successCallback(responseJSON)
                })
                
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
    
    func uploadImages(files: [Data], uploadURL: String, successCallback: @escaping ((_ media: ResponseArray?) -> Void),
                errorCallback: @escaping ((_ error: Error) -> Void),
                networkCallback: @escaping (() -> Void)) {
        
        let headers: [String: String] = [:]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for file in files {
                multipartFormData.append(file, withName: "file[]", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
            }
        }, to: uploadURL, method: .post, headers: headers) { encodingResult in
            
            switch encodingResult {
            case .success(let uploadRequest, _, _):
                
                uploadRequest.validate().debugLog().responseJSON(completionHandler: { response in
                    guard response.result.isSuccess else {
                        errorCallback(response.result.error!)
                        return
                    }
                    print(response)
                    
                    guard let responseJSON = response.value as? JSON, let data = responseJSON["data"] as? ResponseArray else {
                        errorCallback(response.result.error!)
                        return
                    }
                    
                    successCallback(data)
                })
                
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
    
    
//     func upload(file: FileUpload, uploadURL: String, successCallback: @escaping ((_ media: Media) -> Void),
//                       errorCallback: @escaping ((_ error: Error) -> Void),
//                       networkCallback: @escaping (() -> Void)) {
//        
//        let imageData = file.data
//        var headers: [String: String] = [:]
//        let imageName = file.name
//        let mineType = file.type
//        if let accessToken = AuthUtils.getAccessToken() {
//            headers = ["Authorization": "Bearer \(accessToken)", "user_id": AuthUtils.getUserId(), "patient_id": AuthUtils.getUserId()] as! [String : String]
//        }
//        
//        Alamofire.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(imageData!, withName: "media", fileName: imageName!, mimeType: mineType!)
//        }, to: uploadURL, method: .put, headers: headers) { encodingResult in
//            
//            switch encodingResult {
//            case .success(let uploadRequest, _, _):
//                
//                uploadRequest.validate().debugLog().responseJSON(completionHandler: { response in
//                    guard response.result.isSuccess else {
//                        errorCallback(response.result.error!)
//                        return
//                    }
//                    print(response)
//                 
//                    guard let responseJSON = response.value as? JSON, let data = responseJSON["data"] as? JSON, let mediaJSON = data["media"] as? JSON else {
//                        errorCallback(response.result.error!)
//                        return
//                    }
//                    
//                    let media = Media(JSON: mediaJSON)
//                    successCallback(media!)
//                })
//                
//            case .failure(let error):
//                errorCallback(error)
//            }
//        }
//    }
    
}
