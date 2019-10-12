//
//  HomeTableViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell:UITableViewCell{
    
    
    @IBOutlet weak var ivCellImageView: UIImageView!
    
    @IBOutlet weak var vSeparatorView: UIView!
    
    @IBOutlet weak var lCellLabel: UILabel!
    
    @IBOutlet weak var bDisclosureBtn: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
    
}
