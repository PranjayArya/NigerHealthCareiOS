//
//  MenuController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 13/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MenuController:UIViewController{
    
    @IBOutlet weak var cvContainerView: UIView!
    @IBOutlet weak var vSideMenuView: UIView!
    
    @IBOutlet weak var ivProfileImageView: UIImageView!
    
    @IBOutlet weak var lNameLabel: UILabel!
    
    @IBOutlet weak var cContainerLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var vUpdateAvailabiltyView: UIView!
    
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(menuBtnAction(notification:)), name: .menu, object: nil)
        setUpValues()
    }
    
    func setUpValues(){
        
        if let name = AuthUtils.getUserName(){
            lNameLabel.text = name
        }else{
            lNameLabel.text = ""
        }
        
        if let image = AuthUtils.getUserImage(){
            
     ImageDownloadManager.imageDownloadManager.setAsyncImage(fromPartialURLPath: image, placeholderImage: nil, to: ivProfileImageView, useTag: nil, placeholderFillColor: nil)
            
        self.ivProfileImageView.cornerRadius = self.ivProfileImageView.frame.width/2
            self.ivProfileImageView.layer.masksToBounds = true
        
        }
        
        if let hfId = AuthUtils.getHealthFacilityID() {
            
            if hfId == 0{
                self.vUpdateAvailabiltyView.isHidden = true
            }else{
                self.vUpdateAvailabiltyView.isHidden = false
            }
            
            
        }
        
    }
    
    
    @objc func menuBtnAction(notification: NSNotification) {
        
        if cContainerLeadingConstraint.constant == 0 {
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
                
                
                self.cvContainerView.frame.origin.x += 220
             
                
            }) { (_) in
                self.cContainerLeadingConstraint.constant = 220
            }

        }else{
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
                
                     self.cvContainerView.frame.origin.x -= 220

                
            }) { (_) in
                   self.cContainerLeadingConstraint.constant = 0
            }
            
        }
        
        self.cvContainerView.layoutIfNeeded()

    }
    
    
    
    @IBAction func sideMenuBtnActions(_ sender: UIButton) {
        NotificationCenter.default.post(name: .menu, object: nil)
        switch sender.tag {
        case 0:
            self.performSegue(withIdentifier: SegueIdentifiers.menuToProfile, sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: SegueIdentifiers.menuToSavedSearches, sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: SegueIdentifiers.menuToMedicineList, sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: SegueIdentifiers.menuToUpdateAvailability, sender: nil)
            break
        case 4:
            self.performSegue(withIdentifier: SegueIdentifiers.menuToAboutUs, sender: nil)
            break
            
        default:
              self.performLogOut()
            }
        }
    
    
    func performLogOut(){
        ValidationUtils.showAlertViewController(title: "", message: "Do you want to Log Out?", buttons: ["OK","Cancel"], target: self) { (buttonOne) in
            if buttonOne {
                AuthUtils.setAccessToken(accessToken: "")
                self.performSegue(withIdentifier: SegueIdentifiers.menuToSignIn, sender: nil)
                

            }else{
                
            }
        }
        
      }
  
}
    

