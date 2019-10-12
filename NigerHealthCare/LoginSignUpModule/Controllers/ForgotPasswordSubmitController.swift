//
//  ForgotPasswordSubmitController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit


class ForgotPasswordSubmitController:UIViewController{
    
    @IBOutlet weak var tfEmailTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmailTextfield.delegate = self
    }
    
    
    
    @IBAction func submitBtnAction(_ sender: UIButton) {
        
        if tfEmailTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your email.", buttonTitle: "Ok", target: self)
            return
        }
        
        if ValidationUtils.isValidEmail(tfEmailTextfield.text!) == false{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter vaild email.", buttonTitle: "Ok", target: self)
            return
        }
        
        // FORGOT PASSWORD API HIT
        
        //SUCCESS
        self.performSegue(withIdentifier: SegueIdentifiers.ForgotPwdToResetPwd, sender: nil)
        // FAILURE
        
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
}

extension ForgotPasswordSubmitController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
