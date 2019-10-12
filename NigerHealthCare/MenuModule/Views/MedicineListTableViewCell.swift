//
//  MedicineListTableViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 20/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

protocol MedicineListTableViewCellDelegate:class {
    
    func medicineBookmarkedBtnAction(index:Int)
}

class MedicineListTableViewCell:UITableViewCell{
    
    weak var delegate:MedicineListTableViewCellDelegate?
    
    @IBOutlet weak var ivMedicineImageView: UIImageView!
    
    @IBOutlet weak var lMedicineLabel: UILabel!
    
    @IBOutlet weak var lPriceLabel: UILabel!
    
    @IBOutlet weak var lCompositionLabel: UILabel!
    
    @IBOutlet weak var lUsesLabel: UILabel!
    
    
    @IBOutlet weak var bBookmarkBtn: UIButton!
    
    
    
    @IBAction func bBookmarkBtnAction(_ sender: UIButton) {
        delegate?.medicineBookmarkedBtnAction(index: sender.tag)
    }
    
    
    
    
    
    
    
    
}
