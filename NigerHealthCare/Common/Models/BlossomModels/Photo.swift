//
//  Photo.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 15/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    var image:UIImage!
    var name:String!
    var fileSize:Int!
    var filePath:String!
    
    
    var file: FileUpload {
        let imageData = UIImageJPEGRepresentation(image, 0.1)
        print(imageData)
        print(fileSize)
        let fileUpload = FileUpload(name: name, size: fileSize, type: "image/jpg", data: imageData!)
        return fileUpload
    }
    
}

