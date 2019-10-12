//
//  MedicineIdentifierController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MedicineIdentifierController: UIViewController {
    
    
    @IBOutlet weak var tfImprintTextfield: UITextField!
    @IBOutlet weak var tfColorTextfield: UITextField!
    @IBOutlet weak var tfShapeTextfield: UITextField!
    
    @IBOutlet weak var tvShapeColorTableView: UITableView!
    @IBOutlet weak var lTableLabel: UILabel!
    @IBOutlet weak var vPopUpView: UIView!
    
    var selectedPopUpType:Int = 0 // 0 for colors , 1 for shapes
    
    var colors = ["White","Beige","Black","Blue","Brown","Clear","Gold","Grey","Green","Yellow","Red"]
    
    var shapes = ["Barrel","Biconcave","Biconvex","Bowtie","Capsule Shape","Diamond Shape","Egg Shape","Oval","Heart Shape","Round","Spherical"]
    
    
    
    override func viewDidLoad() {
        configureTableView()
        self.vPopUpView.isHidden = true
    }
    
    
    func configureTableView(){
        tvShapeColorTableView.delegate = self
        tvShapeColorTableView.dataSource = self
        tvShapeColorTableView.registerNib(ColorShapeTableViewCell.nameOfClass)
    }
    
    @IBAction func showValuesBtnAction(_ sender: UIButton) {
        
        
        if sender.tag == 0{ // show color
            
            lTableLabel.text = "Select Color"
            
            
        }else{ // show shape
            
            lTableLabel.text = "Select Shape"
        }
        
        selectedPopUpType = sender.tag
        self.vPopUpView.isHidden = false
        self.tvShapeColorTableView.reloadData()
    }
    @IBAction func closeBtnAction(_ sender: UIButton) {
        
        self.vPopUpView.isHidden = true
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        
        if tfImprintTextfield.text!.isEmpty && tfColorTextfield.text!.isEmpty && tfShapeTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Atleast one field is mandatory.", buttonTitle: "Ok", target: self)
            return
        }
        
        //SEARCH API HIT
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func menuBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .menu, object: nil)
    }
}

extension MedicineIdentifierController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPopUpType == 0 ? colors.count : shapes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ColorShapeTableViewCell.nameOfClass, for: indexPath) as! ColorShapeTableViewCell
        cell.lNameLabel.text = selectedPopUpType == 0 ? colors[indexPath.row] : shapes[indexPath.row]
        cell.ivImageView.image = selectedPopUpType == 0 ? UIImage.init(named: "c\(indexPath.row + 1)") : UIImage.init(named: "c\(indexPath.row + 1)")
        cell.bSelectBtn.tag = indexPath.row
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOff"), for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ColorShapeTableViewCell
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOn"), for: .normal)
        
    }

}
