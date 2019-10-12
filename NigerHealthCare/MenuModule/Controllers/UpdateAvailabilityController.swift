//
//  UpdateAvailabilityController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 29/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class UpdateAvailabilityController: UIViewController {
    
    @IBOutlet weak var tfSearchTextfield: UITextField!
    @IBOutlet weak var tvMedicineNameTableview: UITableView!
    
    var medicinesArray = [MedicineModel]()
    
    var sectionHeadings = [String]()
    
    var sectionRows = [Int]()
    
    var sectionValues = [[MedicineModel]]()
    
    var searchEnabled = false
    
    var selectedIndex = 0
    var selectedSection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfSearchTextfield.delegate = self
        tvMedicineNameTableview.delegate = self
        tvMedicineNameTableview.dataSource = self
        tvMedicineNameTableview.registerNib(AvailabilityTableViewCell.nameOfClass)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchEnabled = false
        getMedicinesOfHealthFacility()
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        if tfSearchTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter medicine name.", buttonTitle: "Ok", target: self)
            return
        }else{
            searchMedicinesAPIHit(searchString:tfSearchTextfield.text!)
        }
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    func searchMedicinesAPIHit(searchString:String){
        
        let queryParams = ["query":searchString]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.searchMedicines(headers: headers, params: queryParams, successCallback: { (response) in
            
            if let dict = response {
                
                self.medicinesArray.removeAll()
                
                if let responseArray = dict["content"] as? [NSDictionary]{
                    
                    for obj in responseArray {
                        let medicineObj = MedicineModel(JSON: obj as! [String:AnyObject])
                        self.medicinesArray.append(medicineObj!)
                        print(medicineObj!.name!)
                    }
                    
                    DispatchQueue.main.async {
                        self.tvMedicineNameTableview.reloadData()
                    }
                    
                }
                
            }
            
        }, errorCallback: { (error) in
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
    }
    
    func getMedicinesOfHealthFacility(){
        
        let queryParams = [
            "health_facility_id" : "\(AuthUtils.getHealthFacilityID()!)",
            "page":0,
            "size":500,
            ] as [String : Any]
        
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        
        NigerHealthCareService.getMedicinesHealthFacility(headers: headers, params: queryParams, successCallback: { (response) in
            
            if let dict = response {
                
                self.medicinesArray.removeAll()
                self.sectionHeadings.removeAll()
                self.sectionRows.removeAll()
                self.sectionValues.removeAll()
                
                if let responseArray = dict["content"] as? [NSDictionary]{
                    
                    for obj in responseArray {
                        let medicineObj = MedicineModel(JSON: obj as! [String:AnyObject])
                        self.medicinesArray.append(medicineObj!)
                    }
                   
                    self.convertDataIntoSections(data:self.medicinesArray)
                  
                }
                
                
            }
            
        }, errorCallback: { (error) in
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
        
        
    }
    
    
   
    
  
    func convertDataIntoSections(data:[MedicineModel]){
        
        var dict = [Character:Int]()
        
        for objIndex in 0...(data.count - 1){
            
            let name = (data[objIndex].name! as NSString).capitalized.first!
            
            if dict[name] == nil {
                dict[name] = 0
            }
            dict[name]! += 1
            
        }
        
        let sortedDict = dict.sorted(by: {$0.0 < $1.0})
        let charArray:[Character] = ["0","1","2","3","4","5","6","7","8","9"]
        var sum = 0
        
        sectionHeadings.insert("0-9", at: 0)
        sectionRows.insert(sum, at: 0)
        var counter = 1
        for index in 0..<sortedDict.count{
            if charArray.contains(sortedDict[index].key) == false{
                sectionHeadings.insert("\(sortedDict[index].key)", at: counter)
                sectionRows.insert(sortedDict[index].value, at: counter)
                counter += 1
            }else{
                sum += sortedDict[index].value
            }
        }
        
        sectionRows[0] = sum
        var new = 0
        var prev = 0
        var dummyArray = [MedicineModel]()
        
        for index in 0..<sectionRows.count{
            let curr = sectionRows[index]
            new = curr + prev
            
            for x in prev..<new{
                if data.count > x {
                    dummyArray.append(data[x])
                }
            }
            if dummyArray.count > 0{
                sectionValues.insert(dummyArray, at: index)
            }
            dummyArray = [MedicineModel]()
            prev = new
        }
        
        DispatchQueue.main.async {
            self.tvMedicineNameTableview.reloadData()
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.uAvailablityToMDetails{
            
            let medicineDetailObj = segue.destination as! MedicineDetailController

            if searchEnabled == false{
                medicineDetailObj.medicineModel = sectionValues[selectedSection][selectedIndex]
            }else{
                medicineDetailObj.medicineModel = self.medicinesArray[selectedIndex]
            }

            medicineDetailObj.fromBookmarked = false

            
        }
        
    }
    
}

extension UpdateAvailabilityController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count >= 1{
            searchEnabled = true
            searchMedicinesAPIHit(searchString:textField.text!)
        }else{
            searchEnabled = false
            if medicinesArray.count == 0 {
            getMedicinesOfHealthFacility()
            }
        }
        return true
    }
}

extension UpdateAvailabilityController:UITableViewDataSource,UITableViewDelegate{
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return  searchEnabled == true ? 1 : sectionHeadings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEnabled == true ? self.medicinesArray.count : sectionRows[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AvailabilityTableViewCell.nameOfClass, for: indexPath) as! AvailabilityTableViewCell
       
        cell.delegate = self
        cell.selectionStyle = .none
        
        if searchEnabled == true{
        
            
        cell.bSwitchBtn.tag = indexPath.row
            
        if let name = self.medicinesArray[indexPath.row].name {
            cell.lNameLabel.text = name
        }else{
            cell.lNameLabel.text = ""
        }
        
        if let price = self.medicinesArray[indexPath.row].price {
            cell.lPriceLabel.text = "\(price)"
        }else{
            cell.lPriceLabel.text = "-"
        }
        
        if let stock = self.medicinesArray[indexPath.row].isAvailable {
            
            if stock == true {
                cell.bSwitchBtn.setOn(true, animated: false)
                cell.lStatusLabel.text = "In Stock"
                cell.lStatusLabel.textColor = UIColor.green
            }else{
                cell.bSwitchBtn.setOn(false, animated: false)
                cell.lStatusLabel.text = "Out of Stock"
                cell.lStatusLabel.textColor = UIColor.red
            }

        }else{
            cell.bSwitchBtn.setOn(false, animated: false)
            cell.lStatusLabel.text = "Out of Stock"
            cell.lStatusLabel.textColor = UIColor.red
         }
        }else{
            
            cell.bSwitchBtn.restorationIdentifier = "\(indexPath.section)"
            cell.bSwitchBtn.tag = indexPath.row
            
            if let name = self.sectionValues[indexPath.section][indexPath.row].name {
                cell.lNameLabel.text = name
            }else{
                cell.lNameLabel.text = ""
            }
            
            if let price = self.sectionValues[indexPath.section][indexPath.row].price {
                cell.lPriceLabel.text = "\(price)"
            }else{
                cell.lPriceLabel.text = "-"
            }
            
            if let stock = self.sectionValues[indexPath.section][indexPath.row].isAvailable {
                
                if stock == true {
                    cell.bSwitchBtn.setOn(true, animated: false)
                    cell.lStatusLabel.text = "In Stock"
                    cell.lStatusLabel.textColor = UIColor.green
                }else{
                    cell.bSwitchBtn.setOn(false, animated: false)
                    cell.lStatusLabel.text = "Out of Stock"
                    cell.lStatusLabel.textColor = UIColor.red
                }
                
            }else{
                cell.bSwitchBtn.setOn(false, animated: false)
                cell.lStatusLabel.text = "Out of Stock"
                cell.lStatusLabel.textColor = UIColor.red
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchEnabled == true ? "" :sectionHeadings[section]
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.selectedSection = indexPath.section
        self.performSegue(withIdentifier: SegueIdentifiers.uAvailablityToMDetails, sender: nil)
    }
}

extension UpdateAvailabilityController:AvailabilityTableViewCellDelegate{
    
    func updateAvailabilityAction(indexOf:UISwitch) {
        
        let switchBtn = indexOf
        
        let switchState = switchBtn.isOn
        
        var medicineId = 0
        
        if searchEnabled == true{

            medicineId = self.medicinesArray[switchBtn.tag].id!
        }else{
            medicineId = self.sectionValues[Int(switchBtn.restorationIdentifier!)!][switchBtn.tag].id!
   
        }
        
        let queryParams = [
            "medicine_id":medicineId,
            "health_facility_id" : "\(AuthUtils.getHealthFacilityID()!)"
            ] as [String : Any]
        
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        
        if switchState == true {

            NigerHealthCareService.addMedicinesHealthFacility(headers: headers, params: queryParams, successCallback: { (response) in
                
                self.getMedicinesOfHealthFacility()
                
            }, errorCallback: { (error) in
                ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
                return
            }) {
                ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
                return
            }
 
        }else{
            
            NigerHealthCareService.removeMedicinesHealthFacility(headers: headers, params: queryParams, successCallback: { (response) in
                
                self.getMedicinesOfHealthFacility()
                
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
