//
//  CriteriaSelectionController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class CriteriaSelectionController:UIViewController{
    
    
    @IBOutlet weak var sHealthFacilitySwitchBtn: UISwitch!
    
    @IBOutlet weak var sOtherSwitchBtn: UISwitch!
    
    var selectedCriteria:CriteriaSelection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sHealthFacilitySwitchBtn.setOn(false, animated: false)
        sOtherSwitchBtn.setOn(false, animated: false)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func switchBtnAction(_ sender: UISwitch) {
        
        self.selectedCriteria = CriteriaSelection(rawValue: sender.tag)
       
        if sender.tag == 0{
            sHealthFacilitySwitchBtn.setOn(true, animated: true)
            sOtherSwitchBtn.setOn(false, animated: true)
        }else{
            sOtherSwitchBtn.setOn(true, animated: true)
            sHealthFacilitySwitchBtn.setOn(false, animated: true)
        }
        
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        
        if !sHealthFacilitySwitchBtn.isOn && !sOtherSwitchBtn.isOn {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please select any one criteria.", buttonTitle: "Ok", target: self)
            return
        }
        
        self.performSegue(withIdentifier: SegueIdentifiers.criteriaToSignUp, sender: nil)
    }
    
    
}

extension CriteriaSelectionController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.criteriaToSignUp{
            let signUpObject =  segue.destination as! SignUpController
            signUpObject.selectedCriteria = self.selectedCriteria
        }
        
    }
}
