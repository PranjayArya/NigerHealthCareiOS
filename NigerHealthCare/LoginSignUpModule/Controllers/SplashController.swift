//
//  SplashController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class SplashController:UIViewController{
    
    var authToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let authToken = AuthUtils.getAccessToken() , authToken != ""{
            self.authToken = authToken
            self.getContextAPIHit()
        }else{
            delay(0.5) {
                self.performSegue(withIdentifier: SegueIdentifiers.splashToSignIn, sender: nil)
            }
        }
    }
    
    
    func getContextAPIHit() {
        
        let headers = ["Authorization":authToken]
        
        print(authToken)
        
        ProgressHUD.show()
        
        NigerHealthCareService.userContext(headers: headers, successCallback: { (response) in
            ProgressHUD.dismiss()
            
            if let responseData = response {

                if let responseDict = responseData["user"] as? NSDictionary{
                    
                    if let tagData = responseDict["tag"] as? NSDictionary{
                        
                        
                        if let hfDict = tagData["healthFacility"] as? NSDictionary{
                            
                            if let name  = hfDict["name"] as? String{
                                AuthUtils.setHealthFacilityName(name: name)
                            }
                            
                            if let id = hfDict["id"] as? Int{
                                AuthUtils.setHealthFacilityID(id: id)
                            }
                            
                        }else{
                            AuthUtils.setHealthFacilityName(name: "")
                            AuthUtils.setHealthFacilityID(id: 0)
                        }

                        if let image = tagData["image"] as? String{
                            AuthUtils.setUserImage(userImage: image)
                        }
                        
                        if let name  = tagData["name"] as? String{
                            AuthUtils.setUserName(userName: name)
                        }
                        
                        if let phone = tagData["phone"] as? String{
                            AuthUtils.setUserNumber(userNumber: phone)
                        }
                        
                    }
                    
                    if let email = responseDict["username"]  as? String{
                        AuthUtils.setUserEmail(userEmail: email)
                    }
                    
                    if let id = responseDict["id"]  as? String{
                        AuthUtils.setUserID(userID: id)
                    }
                }
                
            }
            
            self.performSegue(withIdentifier: SegueIdentifiers.splashToHome, sender: nil)
    
        }, errorCallback: { (error) in
            ProgressHUD.dismiss()
            AuthUtils.setAccessToken(accessToken: "")
            self.performSegue(withIdentifier: SegueIdentifiers.splashToSignIn, sender: nil)
            return
        }) {
            ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
 
    }
    
    
    
    
    
}
