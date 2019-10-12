//
//  StoreListCollectionViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 25/04/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

protocol StoreListCollectionViewCellDelegate:class {
    func directionsBtnAction(index:Int)
    func callBtnAction(index:Int)
}

class StoreListCollectionViewCell:UICollectionViewCell{
    
    weak var delegate:StoreListCollectionViewCellDelegate?
    
    @IBOutlet weak var lStoreNameLabel: UILabel!
    
    @IBOutlet weak var lStoreLocationLabel: UILabel!
    
    @IBOutlet weak var lTimeLabel: UILabel!
    
    @IBOutlet weak var bCallButton: UIButton!
    
    @IBOutlet weak var bDirectionsButton: UIButton!
    
    
    @IBAction func directionsBtnAction(_ sender: UIButton) {
        self.delegate?.directionsBtnAction(index:sender.tag)
    }
    
    
    @IBAction func callBtnAction(_ sender: UIButton) {
        self.delegate?.callBtnAction(index:sender.tag)
    }
    
}
