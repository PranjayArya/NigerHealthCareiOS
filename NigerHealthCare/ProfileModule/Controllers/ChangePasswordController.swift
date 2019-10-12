//
//  ChangePasswordController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 24/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class ChangePasswordController:UIViewController{
    
    
    @IBOutlet weak var tfOldPasswordTextField: UITextField!
    
    @IBOutlet weak var tfNewPasswordTextField: UITextField!
    
    @IBOutlet weak var tfReNewPasswordTextField: UITextField!
    
    @IBOutlet weak var bOldPwdShowBtn: UIButton!
    
    @IBOutlet weak var bNewPwdShowBtn: UIButton!
    
    @IBOutlet weak var bReNewPwdShowBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        self.tfOldPasswordTextField.delegate = self
        self.tfNewPasswordTextField.delegate = self
        self.tfReNewPasswordTextField.delegate = self
    }
    
    
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    @IBAction func showBtnAction(_ sender: UIButton) {
        
        if sender.tag == 0{
            if tfOldPasswordTextField.isSecureTextEntry {
                tfOldPasswordTextField.isSecureTextEntry = false
                bOldPwdShowBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfOldPasswordTextField.isSecureTextEntry = true
                bOldPwdShowBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }else if sender.tag == 1{
            if tfNewPasswordTextField.isSecureTextEntry {
                tfNewPasswordTextField.isSecureTextEntry = false
               bNewPwdShowBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfNewPasswordTextField.isSecureTextEntry = true
               bNewPwdShowBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }else{
            if tfReNewPasswordTextField.isSecureTextEntry {
                tfReNewPasswordTextField.isSecureTextEntry = false
               bReNewPwdShowBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfReNewPasswordTextField.isSecureTextEntry = true
               bReNewPwdShowBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }
        
        
    }
    
    
    @IBAction func savePasswordBtnAction(_ sender: UIButton) {
        
        if tfOldPasswordTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your old password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfNewPasswordTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfNewPasswordTextField.text!.count <= 5{
            ValidationUtils.showAlertViewController(title: "Error", message: "Password should have atleast characters.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfReNewPasswordTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please re-enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfNewPasswordTextField.text! != tfReNewPasswordTextField.text!{
            ValidationUtils.showAlertViewController(title: "Error", message: "Passwords does not match.", buttonTitle: "Ok", target: self)
            return
        }
        
        
        let userId = AuthUtils.getUserID()!
        
        let headers = ["Content-Type":"application/json",
                       "Authorization":"\(AuthUtils.getAccessToken()!)"]
        let body = [
            "oldPassword" : tfOldPasswordTextField.text!,
            "password" : tfNewPasswordTextField.text!,
            "retypePassword" : tfReNewPasswordTextField.text!
        ]
        
        ProgressHUD.show()
        
        NigerHealthCareService.changePassword(userId: userId, headers: headers, body: body, successCallback: { (response) in
            ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Success", message: "Password changed successfully.", buttonTitle: "Ok", target: self)
            return

        },errorCallback: { (error) in
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

extension ChangePasswordController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
}

