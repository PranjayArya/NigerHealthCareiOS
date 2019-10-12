//
//  CommonFunctions.swift
//  Cross
//
//  Created by Abhayam Rastogi on 30/06/16.
//  Copyright © 2016 Abhayam Rastogi. All rights reserved.
//


import UIKit
import SVProgressHUD


//import SwiftKeychainWrapper

func datetimeWithDate(_ date:Date , time:Date) -> Date? {
    
    let currentCalendar = Calendar.current
    let dateComponents = (currentCalendar as NSCalendar).components([.day,.month, .year], from: date)
    let hourComponents = (currentCalendar as NSCalendar).components([.hour ,.minute], from: time)
    
    let dateWithTime = (currentCalendar as NSCalendar).date(byAdding: hourComponents, to:currentCalendar.date(from: dateComponents)!, options:NSCalendar.Options(rawValue: 0))
    
    return dateWithTime;
    
}




func fetchJSONResourceWithName(_ name:String, completionHandler:(_ resultJson:AnyObject?,_ error:NSError?)->()){
    
    
    let resourceURL:URL? = Bundle.main.url(forResource: name, withExtension: "json")
    
    if resourceURL == nil{
        return
    }
    
    do {
        let jsonData:Data = try Data(contentsOf: resourceURL!, options: NSData.ReadingOptions.mappedIfSafe)
        
        let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
        
        completionHandler(json as AnyObject?, nil)
    }catch let error as NSError {
        completionHandler(nil, error)
    }
}

func fetchPlistDataWithName(_ name:String) -> AnyObject? {

    if let fileUrl = Bundle.main.url(forResource: name, withExtension: "plist"),
        let data = try? Data(contentsOf: fileUrl) {
        if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) { // [String: Any] which ever it is
            return result as AnyObject?
        }
        return nil
    }
    return nil
    
}

func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
}

/**
 Function will change UI properties of passed button.
 */

func beautifyImageView(_ imageView : UIImageView)
{
    //imageView.backgroundColor = UIColor.init(red: 45.0/255.0, green: 55.0/255.0, blue: 69.0/255.0, alpha: 0.3)
    imageView.layer.borderWidth = 2.0
    imageView.layer.cornerRadius = 10.0
    imageView.layer.borderColor = UIColor.clear.cgColor
}

func beautifyButton(_ button : UIButton)
{
    let buttonBgColor = UIColor.white
    button.layer.borderWidth = 1.0
    button.layer.cornerRadius = 2.0
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.backgroundColor = buttonBgColor
}

func beautifyPopUpButton(_ button : UIButton)
{
    let buttonBgColor = UIColor.init(red: 226.0/255.0, green: 176.0/255.0, blue: 20.0/255.0, alpha: 1.0)
    button.layer.borderWidth = 2.0
    button.layer.cornerRadius = 10.0
    button.layer.borderColor = UIColor.darkGray.cgColor
    button.backgroundColor = buttonBgColor
}


func mainStoryBoard()->UIStoryboard{
    return UIStoryboard(name: "Main", bundle: nil)
}



func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

// MARK: - SVProgressHUD config methods

func showProgressHUD(withStatus:String?){
  if !ValidationUtils.isTextEmpty(withStatus){
    SVProgressHUD.show(withStatus: withStatus)
  }else{
    SVProgressHUD.show()
  }
  SVProgressHUD.setDefaultStyle(.custom)
  SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
  SVProgressHUD.setDefaultMaskType(.gradient)
}


func showProgressHUD(withStatus:String?,maskType:ProgressHUDMaskType){
    if !ValidationUtils.isTextEmpty(withStatus){
        SVProgressHUD.show(withStatus: withStatus)
    }else{
        SVProgressHUD.show()
    }
    SVProgressHUD.setDefaultStyle(.custom)
    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
   
    switch maskType {
    case .none:
      SVProgressHUD.setDefaultMaskType(.none)

    case .clear: // don't allow user interactions
        SVProgressHUD.setDefaultMaskType(.clear)

    case .black: // don't allow user interactions and dim the UI in the back of the HUD, as on iOS 7 and above
        SVProgressHUD.setDefaultMaskType(.black)

    case .gradient: // don't allow user interactions and dim the UI with a a-la UIAlertView background gradient, as on iOS 6
        SVProgressHUD.setDefaultMaskType(.gradient)

    case .custom:
        SVProgressHUD.setDefaultMaskType(.custom)
    }
}

func dismissProgressHUD(){
  SVProgressHUD.dismiss()
}



func distinct<T: Equatable>(source: [T]) -> [T] {
    var unique = [T]()
    for item in source {
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}

func calculateBMIWithWeightInKilograms(weightInKilograms:Double, heightInMeters:Double) -> Double?
{
    if heightInMeters == 0 {
        return nil;
    }
    return (weightInKilograms/(heightInMeters*heightInMeters));
}

func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

//MARK: Constraints
 func pinSubview(subview:UIView,superView:UIView,
                        attribute:NSLayoutAttribute,constant:CGFloat){
    
    superView.addConstraint(NSLayoutConstraint(item: superView,
                                               attribute: attribute, relatedBy: NSLayoutRelation.equal,
                                               toItem: subview, attribute: attribute, multiplier: 1.0,
                                               constant: constant))
    
}

 func pinAllEdgesOfSubview(subview:UIView,superView:UIView){
    pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.bottom,constant:0.0)
    pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.top,constant:0.0)
    pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.leading,constant:0.0)
    pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.trailing,constant:0.0)
    
}

//MARK: Random Number
func randomNumber()->UInt32{
    return arc4random_uniform(64)
}

//MARK: Notification

func removeNotification(_ sender:AnyObject){
    NotificationCenter.default.removeObserver(sender)
}

func addNotification(_ name:String,sender:AnyObject, selector:Selector, objc: AnyObject?){
    
    NotificationCenter.default.addObserver(sender, selector: selector, name: NSNotification.Name(rawValue: name), object: objc)
}

func postNotification(_ name: String, objc: [String:AnyObject]?){
    NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil, userInfo: objc)
}

func removeNotification(_ name:String,observer:AnyObject){
    
    NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: name), object: nil)
}

// KeyChain Wrapper

//func saveKeyChainValue(value : String, keyValue: String) {
//    KeychainWrapper.setString(value, forKey: keyValue)
//}
//
//func getKeyChainValue(keyValue: String) -> AnyObject? {
//    return KeychainWrapper.stringForKey(keyValue)
//}

//MARK: Utilities

///  Calls action when a screen shot is taken
func detectScreenShot(_ action: @escaping () -> ()) {
    let mainQueue = OperationQueue.main
    NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil, queue: mainQueue) { notification in
        // executes after screenshot
        action()
    }
}



func changeRootViewController(with identifier:String!) {
    let appDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    let desiredViewController = mainStoryBoard().instantiateViewController(withIdentifier: identifier);
    
    let snapshot:UIView = (appDelegate.window?.snapshotView(afterScreenUpdates: true))!
    desiredViewController.view.addSubview(snapshot);
    
    appDelegate.window?.rootViewController = desiredViewController;
    
    UIView.animate(withDuration: 0.3, animations: {() in
        snapshot.layer.opacity = 0;
        snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
    });
}

public func monthString(month:UInt8?)->String{
    if month == nil{
        return ""
    }
    switch month! {
    case 1:
        return "Jan"
    case 2:
        return "Feb"
    case 3:
        return "Mar"
    case 4:
        return "Apr"
    case 5:
        return "May"
    case 6:
        return "Jun"
    case 7:
        return "Jul"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Nov"
    case 12:
        return "Dec"
    default:
        return ""
    }
}


