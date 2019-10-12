//
//  MedicineDetailController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 16/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MedicineDetailController:UIViewController{
    
    
    @IBOutlet weak var vContentView: UIView!
    
    @IBOutlet weak var ivImageView: UIImageView!
    
    @IBOutlet weak var lMedicineLabel: UILabel!
    
    @IBOutlet weak var lPriceLabel: UILabel!
    
    @IBOutlet weak var lCompositionLabel: UILabel!
    
    @IBOutlet weak var lUsesLabel: UILabel!
    
    
    @IBOutlet weak var lCategoryLabel: UILabel!
    
    @IBOutlet weak var lUnitPackLabel: UILabel!
    
    @IBOutlet weak var vPriceCalculatorVIew: UIView!
    
    @IBOutlet weak var tfAgeTextField: UITextField!
    
    @IBOutlet weak var tfDurationTextField: UITextField!
    
    @IBOutlet weak var tfIntakeTextField: UITextField!
    
    @IBOutlet weak var lCalculatedPriceLabel: UILabel!
    
    @IBOutlet weak var lSelectionLabel: UILabel!
    
    @IBOutlet weak var vPopUpView: UIView!
    
    @IBOutlet weak var tvSelectionTableView: UITableView!
    
    var selectedDropDownBtn = 0
    
    var selectedDurationIndex = 0
    
    var selectedIntakeIndex = 0
    
    
    var ageGroupData = ["<38 weeks gestational age (Premature)","> 38 weeks gestational age (Term Newborn)","0 – 30 days","1 month – 2 years","2 – 6 years","6 – 12 years","12 – 18 years","Above 18 years"]
    
    var durationData = ["1 day","2 days","3 days","4 days","5 days","6 days","7 days","8 days","9 days","10 days","11 days","12 days","13 days","14 days","15 days","16 days","17 days","18 days","19 days","20 days","21 days","22 days","23 days","24 days","25 days","26 days","27 days","28 days","29 days","30 days"]
    
    var intakeData = ["1 Per Day","2 Per Day","3 Per Day","4 Per Day","1 Every Alternate Day","1 Every 3 Days","1 Per Week","1 Per Month"]
    
    
    
    
    
    
    
    @IBAction func dropDownBtnAction(_ sender: UIButton) {
        
        if sender.tag == 0{
            lSelectionLabel.text = "Select Age Group"
        }else if sender.tag == 1{
            lSelectionLabel.text = "Select Duration"
        }else{
            lSelectionLabel.text = "Select Intake Quantity"
        }
        
        selectedDropDownBtn = sender.tag
        self.vPopUpView.isHidden = false
        self.tvSelectionTableView.reloadData()
    }
    
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.vPopUpView.isHidden = true
    }
    
    
    
    var medicineModel:MedicineModel?
    var fromBookmarked = false
    
    
    
    @IBAction func calculateBtnAction(_ sender: UIButton) {
        
        
        if tfIntakeTextField.text!.isEmpty {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please select intake quantity.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfDurationTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please select duration.", buttonTitle: "Ok", target: self)
            return
        }
        
        let duration = self.durationData[selectedDurationIndex].components(separatedBy: " ")[0]
        
        var intakeValue:Float = 0.0
        
        switch self.selectedIntakeIndex {
        case 0:
            intakeValue = 1.0
        case 1:
            intakeValue = 2.0
        case 2:
            intakeValue = 3.0
        case 3:
            intakeValue = 4.0
        case 4:
            intakeValue = 1.5
        case 5:
            intakeValue = 0.33
        case 6:
            intakeValue = 0.14
        default:
            intakeValue = 0.03
        }
        
        let calculatedPrice:Float = Float(duration)! * Float(intakeValue) * Float(medicineModel!.price!)

        self.lCalculatedPriceLabel.text = String(format: "%.2f", calculatedPrice)
        
        
    }
    
    
    
    
    
    
    func setUpData(){
        
        self.vPopUpView.isHidden = true
        tvSelectionTableView.delegate = self
        tvSelectionTableView.dataSource = self
        tvSelectionTableView.registerNib(ColorShapeTableViewCell.nameOfClass)
        
        
        tfAgeTextField.isUserInteractionEnabled = false
        tfIntakeTextField.isUserInteractionEnabled = false
        tfDurationTextField.isUserInteractionEnabled = false
        
        
        if let name = self.medicineModel!.name {
            lMedicineLabel.text = name
        }
        
        
        if let price = medicineModel!.price {
            lPriceLabel.text = "\(price) Nigerian Dollar"
            self.vPriceCalculatorVIew.isHidden = false
        }else{
            lPriceLabel.text = ""
            self.vPriceCalculatorVIew.isHidden = true
        }
        
        lCompositionLabel.text = ""
        
        if let uses = self.medicineModel!.uses {
            lUsesLabel.text = uses
        }else{
            lUsesLabel.text = ""
        }
        
        if let cat = self.medicineModel!.category {
            lCategoryLabel.text = cat
        }else{
            lCategoryLabel.text = ""
        }
        
        if let unit = self.medicineModel!.unitPack {
            lUnitPackLabel.text = unit
        }else{
            lUnitPackLabel.text = ""
        }
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setUpData()
    }
    
    
    
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func bookmarkBtnActn(_ sender: Any) {
        
        let id  = AuthUtils.getUserID()!
        let medicineId = self.medicineModel!.id!
        let params = ["user_id": id ,
                      "medicine_id": "\(medicineId)"
        ]
        
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        
        if fromBookmarked == true{
          
            
            NigerHealthCareService.unbookmarkMedicine(headers: headers, params: params, successCallback: { (response) in
                
                ValidationUtils.showAlertViewController(title: "Success", message: "Medicine successfully unbookmarked.", buttonTitle: "Ok", target: self)
                return
                
                
            }, errorCallback: { (error) in
                ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
                return
            }) {
                ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
                return
            }
        }else{
            
            NigerHealthCareService.bookmarkMedicine(headers: headers, params: params, successCallback: { (response) in
                
                ValidationUtils.showAlertViewController(title: "Success", message: "Medicine successfully bookmarked.", buttonTitle: "Ok", target: self)
                return
                
            }, errorCallback: { (error) in
                ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
                return
            }) {
                ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
                return
            }
            
            
        }
        
    }
    
}


extension MedicineDetailController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedDropDownBtn == 0 {
            return self.ageGroupData.count
        }else if selectedDropDownBtn == 1{
            return self.durationData.count
        }else{
            return self.intakeData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorShapeTableViewCell.nameOfClass, for: indexPath) as! ColorShapeTableViewCell

        cell.cNameLabelConstraint.constant = 25
        
        if selectedDropDownBtn == 0 {
            cell.lNameLabel.text =  self.ageGroupData[indexPath.row]
        }else if selectedDropDownBtn == 1{
            cell.lNameLabel.text =  self.durationData[indexPath.row]
        }else{
            cell.lNameLabel.text = self.intakeData[indexPath.row]
        }
        cell.ivImageView.isHidden = true
        cell.bSelectBtn.tag = indexPath.row
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOff"), for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ColorShapeTableViewCell
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOn"), for: .normal)
        
        if selectedDropDownBtn == 0{
            self.tfAgeTextField.text = self.ageGroupData[indexPath.row]
        }else if selectedDropDownBtn == 1{
            self.tfDurationTextField.text =  self.durationData[indexPath.row]
            self.selectedDurationIndex = indexPath.row
        }else{
            self.tfIntakeTextField.text = self.intakeData[indexPath.row]
            self.selectedIntakeIndex = indexPath.row
        }
        self.vPopUpView.isHidden = true
    }
    
}
