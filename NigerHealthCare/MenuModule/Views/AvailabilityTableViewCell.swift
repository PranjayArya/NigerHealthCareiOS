//
//  AvailabilityTableViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 29/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit


protocol AvailabilityTableViewCellDelegate:class{
    
    func updateAvailabilityAction(indexOf:UISwitch)
    
}

class AvailabilityTableViewCell:UITableViewCell{
    
    weak var delegate:AvailabilityTableViewCellDelegate?
    
    
    @IBOutlet weak var lNameLabel: UILabel!
    
    @IBOutlet weak var lPriceLabel: UILabel!
    
    @IBOutlet weak var lStatusLabel: UILabel!
    
    @IBOutlet weak var bSwitchBtn: UISwitch!
    
    @IBAction func bSwitchBtnAction(_ sender: UISwitch) {
        self.delegate?.updateAvailabilityAction(indexOf: sender)
    }
    
    
}
