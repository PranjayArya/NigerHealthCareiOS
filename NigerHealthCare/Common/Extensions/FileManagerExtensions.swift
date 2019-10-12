//
//  FileManagerExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 25/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension FileManager {
    
    static func fetchJSONResourceWithName(_ name:String, completionHandler:(_ resultJson:AnyObject?,_ error:NSError?)->()){
        
        let resourceURL:URL? = Bundle.main.url(forResource: name, withExtension: "json")
        if resourceURL == nil{
            completionHandler(nil, nil)
        }
        do {
            let jsonData:Data = try Data(contentsOf: resourceURL!, options: NSData.ReadingOptions.mappedIfSafe)
            
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            completionHandler(json as AnyObject?, nil)
        }catch let error as NSError {
            completionHandler(nil, error)
        }
    }
    
    static func readDataFromFile(_ name:String, type:String, inDirectory:String? = nil, completionHandler:(_ resultString:AnyObject?,_ error:NSError?)->()){
        
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: type)
            else {
                return
        }
        do {
            
            let data:Data = try Data(contentsOf: fileURL, options: NSData.ReadingOptions.mappedIfSafe)
            
            let contents =  String.init(data: data, encoding: String.Encoding.utf8)
            completionHandler(contents as AnyObject?, nil)
        }catch let error as NSError {
            completionHandler(nil, error)
        }
    }
    
    
    static func fetchPlistDataWithName(_ name:String) -> AnyObject? {
        
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) { // [String: Any] which ever it is
                return result as AnyObject?
            }
            return nil
        }
        return nil
        
    }
    
}
