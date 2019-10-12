//
//  SingInController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 16/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class SignInController: UIViewController {
    
    
    
    @IBOutlet weak var tfEmailPhoneTextfield: UITextField!
    @IBOutlet weak var tfPasswordTextfield: UITextField!
    @IBOutlet weak var bPasswordToggleBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmailPhoneTextfield.delegate = self
        tfPasswordTextfield.delegate = self
    }
    
   
    @IBAction func passwordToggleBtnAction(_ sender: Any) {
        
        if tfPasswordTextfield.isSecureTextEntry {
            tfPasswordTextfield.isSecureTextEntry = false
            bPasswordToggleBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
        }else{
            tfPasswordTextfield.isSecureTextEntry = true
            bPasswordToggleBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
        }
        
    }
    
    
    @IBAction func signInBtnAction(_ sender: Any) {
        
        if tfEmailPhoneTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your email or phone number.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPasswordTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        
        //SIGN IN API HIT
        let body:RequestBody = [ "username": tfEmailPhoneTextfield.text!,
                                 "password": tfPasswordTextfield.text!
        ]
        
        ProgressHUD.show()
        
        NigerHealthCareService.userLogin(body: body, successCallback: { (response) in
            ProgressHUD.dismiss()
            if let responseDict = response {
                
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
             self.performSegue(withIdentifier: SegueIdentifiers.signInToHome, sender: nil)
            
        }, errorCallback: { (error) in
            ProgressHUD.dismiss()
            
            print(error.description)
            
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
        
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: SegueIdentifiers.signInToCriteria, sender: nil)
    }
    
    
    @IBAction func socialSignInUpBtnAction(_ sender: UIButton) {

        if sender.tag == 0{ // Google Login
             GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()

        }else{ // FB Login
            let loginManager = FBSDKLoginManager()
            let permissions = ["public_profile", "email"]
            loginManager.logIn(withReadPermissions: permissions, from: self) { (loginResult, error) in
                switch loginResult {
                case .none:
                    ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
                    return
                case .some(_):
                    self.socialLoginAPIHit(tag:"FACEBOOK",token:loginResult!.token.tokenString)
                }
            }
        }
    }
    
    func socialLoginAPIHit(tag:String,token:String){
        
        let params = ["tag":tag,
                      "id":token
            ] as QueryParams
        
        ProgressHUD.show()
        NigerHealthCareService.socialLogin(params: params, successCallback: { (response) in
            ProgressHUD.dismiss()
            self.performSegue(withIdentifier: SegueIdentifiers.signInToHome, sender: nil)
            
        }, errorCallback: { (error) in
            ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }

    }
    
    
    
}

extension SignInController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

extension SignInController:GIDSignInDelegate,GIDSignInUIDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let _ = error{
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }else{

            self.socialLoginAPIHit(tag:"GOOGLE",token:user.authentication.idToken)
        }
    }
    
}
