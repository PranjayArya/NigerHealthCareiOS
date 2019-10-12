//
//  VerifyOTPController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 5/06/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class VerifyOTPController:UIViewController{
    
    
    @IBOutlet weak var tfOTPTextField: UITextField!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tfOTPTextField.delegate = self
        
    }
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func submitBtnAction(_ sender: UIButton) {
        
        if tfOTPTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter OTP.", buttonTitle: "Ok", target: self)
            return
        }
        
    }
    
    
}

extension VerifyOTPController:UITextFieldDelegate{
    
}
