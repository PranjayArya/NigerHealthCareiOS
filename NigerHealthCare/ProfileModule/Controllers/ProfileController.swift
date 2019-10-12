//
//  ProfileController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class ProfileController:UIViewController{
    
    @IBOutlet weak var bEditProfileBtn: UIButton!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var tfPhoneTextfield: UITextField!
    @IBOutlet weak var tfEmailTextfield: UITextField!
    @IBOutlet weak var tfHealthFacilityTextfield: UITextField!
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        
        setUpProfileView()
    }
    
    
    func setUpProfileView(){
        
        if let name = AuthUtils.getUserName(){
            lNameLabel.text = name
        }else{
            lNameLabel.text = ""
        }
        
        
        if let email = AuthUtils.getUserEmail(){
            tfEmailTextfield.text = email
        }else{
            tfEmailTextfield.text = " "
        }
        
        if let phone = AuthUtils.getUserNumber(){
            tfPhoneTextfield.text = phone
        }else{
            tfPhoneTextfield.text = " "
        }
        
        
        
        if let image = AuthUtils.getUserImage(){
            
            let imageView = UIImageView()
            ImageDownloadManager.imageDownloadManager.setAsyncImage(fromPartialURLPath: image, placeholderImage: nil, to: imageView, useTag: nil, placeholderFillColor: nil)
            
            self.bEditProfileBtn.setImage(imageView.image!, for: .normal)
            
            self.bEditProfileBtn.cornerRadius = self.bEditProfileBtn.frame.width/2
            self.bEditProfileBtn.layer.masksToBounds = true
            
        }

    }
    
    
    @IBAction func profileImageBtnAction(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: SegueIdentifiers.profileToChangePwd, sender: nil)
    }
    
    
    
}
