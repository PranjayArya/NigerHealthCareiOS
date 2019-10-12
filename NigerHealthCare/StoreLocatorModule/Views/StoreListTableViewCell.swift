//
//  StoreListTableViewCell.swift
//  NigerHealthCare
//
//  Created by Pranjay on 8/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

protocol StoreListTableViewCellDelegate:class {
    func listDirectionsBtnAction(index:Int)
    func listCallBtnAction(index:Int)
    func listBookmarkedBtnAction(index:Int)
}

class StoreListTableViewCell:UITableViewCell{
    
    
    weak var delegate:StoreListTableViewCellDelegate?
    
    @IBOutlet weak var lStoreNameLabel: UILabel!
    @IBOutlet weak var lStoreLocationLabel: UILabel!
    @IBOutlet weak var lTimeLabel: UILabel!
    @IBOutlet weak var lStatusLabel: UILabel!
    @IBOutlet weak var bDirectionsBtn: UIButton!
    @IBOutlet weak var bCallBtn: UIButton!
    @IBOutlet weak var bBookmarkedBtn: UIButton!
    @IBOutlet weak var vContentView: UIView!
    
    @IBAction func directionsBtnAction(_ sender: UIButton) {
        self.delegate?.listDirectionsBtnAction(index: sender.tag)
    }
    
    @IBAction func callBtnAction(_ sender: UIButton) {
        self.delegate?.listCallBtnAction(index: sender.tag)
    }
    
    @IBAction func bookmarkedBtnAction(_ sender: UIButton) {
        self.delegate?.listBookmarkedBtnAction(index: sender.tag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
    
}
