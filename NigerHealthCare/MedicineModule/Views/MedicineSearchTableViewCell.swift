//
//  MedicineSearchTableViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MedicineSearchTableViewCell:UITableViewCell{
    
    @IBOutlet weak var lHeadingLabel: UILabel!
    @IBOutlet weak var vSeparatorView: UIView!
    @IBOutlet weak var lSubHeadingLabel: UILabel!
    @IBOutlet weak var lUnitPackLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
    
}
