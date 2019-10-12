//
//  CommonExtensions.swift
//  Cross
//
//  Created by Abhayam Rastogi on 30/06/16.
//  Copyright © 2016 Abhayam Rastogi. All rights reserved.
//


import UIKit


// MARK: Integer Extensions

extension Int {
    func format(_ f: String) -> String {
        return NSString(format: "%\(f)d" as NSString, self) as String
    }
}

//MARK: Double Extensions

extension Double {
    func format(_ f: String) -> String {
        return NSString(format: "%\(f)f" as NSString, self) as String
    }
}

// MARK: Remove White Spaces

//MARK: String Extensions


extension String{
    
    public func positionOfSubstring(_ subString: String, caseInsensitive: Bool = false, fromEnd: Bool = false) -> Int {
        if subString.isEmpty {
            return -1
        }
        var searchOption = fromEnd ? NSString.CompareOptions.anchored : NSString.CompareOptions.backwards
        if caseInsensitive {
            searchOption.insert(NSString.CompareOptions.caseInsensitive)
        }
        if let range = self.range(of: subString, options: searchOption), !range.isEmpty {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        }
        return -1
    }
    
    /// Cut string from integerIndex to the end
    public subscript(integerIndex: Int) -> Character {
        let index = characters.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }
    
    var condenseWhitespace:String{
        return  self.replacingOccurrences(of: " ", with: "")
    }
    
}

//UIImage Extentioms

extension UIImage {
    var rounded: UIImage? {
        let imageView = UIImageView(image: self)
        imageView.layer.cornerRadius = min(size.height/2, size.width/2)
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    var circle: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}

// localizing String with comment

extension String{
    
    func localizedStringWithComment(_ comment:String)-> String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: self, comment: comment)
    }
    
}


extension CGSize {
    var WINDOW_HEIGHT: CGFloat {
        return UIScreen.main.bounds.self.height
    }
}
//MARK: NSFileManager

extension FileManager {
    class func documentsDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    
    class func cachesDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        return paths[0]
    }
}

//extension Data {
//    
//    public var hexString: String {
//        return self.toHexString()
//    }
//    
//    func toHexString() -> String {
//        let count = self.count / MemoryLayout<UInt8>.size
//        var bytesArray = [UInt8](repeating: 0, count: count)
//        (self as NSData).getBytes(&bytesArray, length:count * MemoryLayout<UInt8>.size)
//        
//        var s:String = "";
//        for byte in bytesArray {
//            s = s + String(format:"%02X", byte)
//        }
//        return s;
//    }
//    
//    public func arrayOfBytes() -> [AnyObject] {
//        let count = self.count / MemoryLayout<UInt8>.size
//        var bytesArray = [AnyObject](repeating: 0, count: count)
//        (self as NSData).getBytes(&bytesArray, length:count * sizeof(UInt8))
//        return bytesArray
//    }
//    
//    static public func withBytes(_ bytes: [UInt8]) -> Data {
//        return Data(bytes: UnsafePointer<UInt8>(bytes), count: bytes.count)
//    }
//    
//    
//}

extension String {
    
    func stringByURLEncoding() -> String? {
        
        let characters = (CharacterSet.urlQueryAllowed as NSCharacterSet).mutableCopy() as! NSMutableCharacterSet
        
        characters.removeCharacters(in: "&")
        
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: characters as CharacterSet) else {
            return nil
        }
        
        return encodedString
        
    }
    
    /**
     Encode a String to Base64
     
     :returns:
     */
    func toBase64()->String{
        
        let data = self.data(using: String.Encoding.utf8)
        
        return data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
    }
}

extension Dictionary {
    mutating func update(_ other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

//
//extension AppDelegate{
//  
//  static func sharedInstance()->AppDelegate{
//    return UIApplication.shared.delegate as! AppDelegate
//  }
//  
//}

//UIFont
extension UIFont{
  func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
    return NSString(string: string).boundingRect(with: CGSize(width: width, height: DBL_MAX),
                                                         options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                         attributes: [kCTFontAttributeName as NSAttributedStringKey: self],
                                                         context: nil).size
  }
}

//UIImage
extension UIImage {
  func placeholderImage()->UIImage?{
    return UIImage(named: "placeholder")
  }
  
  static func defaultPlayImage()->UIImage{
    return UIImage(named:"play")!
  }
  
  static func defaultPauseImage()->UIImage{
    return UIImage(named:"pause")!
    
  }
}

extension UIImage{
  func imageMaskedWithColor(maskColor:UIColor)->UIImage{
    
    let imageRect:CGRect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.width)
    var newImage:UIImage?
    UIGraphicsBeginImageContextWithOptions(imageRect.size, false, self.scale)
    let context:CGContext = UIGraphicsGetCurrentContext()!
    context.scaleBy(x: 1.0, y: -1.0)
    context.translateBy(x: 0, y: -imageRect.size.height)
    context.clip(to: imageRect, mask: self.cgImage!)
    context.setFillColor(maskColor.cgColor)
    context.fill(imageRect)
    newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    return newImage!
  }
}


extension UIImageView {
  
  func setRounded() {
    let radius = self.frame.width / 2
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
  }
}

extension UIButton {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension Notification.Name {
    static let menu = Notification.Name("menu")
}

