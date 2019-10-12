//
//  ForgotPasswordController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 16/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit


class ForgotPasswordController: UIViewController {
    
    @IBOutlet weak var tfPasswordTextfield: UITextField!
    @IBOutlet weak var tfRePasswordTextfield: UITextField!
    @IBOutlet weak var bTogglePasswordBtn: UIButton!
    @IBOutlet weak var bToggleRePasswordBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfPasswordTextfield.delegate = self
        tfRePasswordTextfield.delegate = self
    }
    
    @IBAction func togglePasswordBtnAction(_ sender: UIButton) {
        
        if sender.tag == 0{
            if tfPasswordTextfield.isSecureTextEntry {
                tfPasswordTextfield.isSecureTextEntry = false
                bTogglePasswordBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfPasswordTextfield.isSecureTextEntry = true
                bTogglePasswordBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }else{
            if tfRePasswordTextfield.isSecureTextEntry {
                tfRePasswordTextfield.isSecureTextEntry = false
                bToggleRePasswordBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfRePasswordTextfield.isSecureTextEntry = true
                bToggleRePasswordBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }
        
    }
    
    
    @IBAction func resetPasswordBtnAction(_ sender: UIButton) {
        if tfPasswordTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPasswordTextfield.text!.count <= 5{
            ValidationUtils.showAlertViewController(title: "Error", message: "Password should have atleast characters.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfRePasswordTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please re-enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPasswordTextfield.text! != tfRePasswordTextfield.text!{
            ValidationUtils.showAlertViewController(title: "Error", message: "Passwords does not match.", buttonTitle: "Ok", target: self)
            return
        }
        
        
        //RESET PASSWORD API HIT
        
        //SUCCESS
        self.performSegue(withIdentifier: SegueIdentifiers.resetPwdToSignIn, sender: nil)
        //FAILURE
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension ForgotPasswordController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
