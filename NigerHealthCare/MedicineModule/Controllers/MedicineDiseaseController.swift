//
//  MedicineDiseaseController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MedicineDiseaseController:UIViewController{
    
    @IBOutlet weak var tfSearchTextfield: UITextField!
    @IBOutlet weak var tvMedicineDiseaseTableview: UITableView!
    
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
        tvMedicineDiseaseTableview.delegate = self
        tvMedicineDiseaseTableview.dataSource = self
        tvMedicineDiseaseTableview.registerNib(MedicineSearchTableViewCell.nameOfClass)
        getMedicinesAPIHit(searchString:"")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        if tfSearchTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter disease.", buttonTitle: "Ok", target: self)
            return
        }else{
            
            searchMedicinesAPIHit(searchString:tfSearchTextfield.text!)
        }
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func menuBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .menu, object: nil)
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
                        self.tvMedicineDiseaseTableview.reloadData()
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
    
    func getMedicinesAPIHit(searchString:String){
        
        let queryParams = ["page":0,
                           "size":500,
                           "sort":"name,asc"] as [String : Any]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.getMedicines(headers: headers, params: queryParams, successCallback: { (response) in
            
            
            if let dict = response {
                
                self.medicinesArray.removeAll()
                
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
                dummyArray.append(data[x])
            }
            
            sectionValues.insert(dummyArray, at: index)
            dummyArray = [MedicineModel]()
            prev = new
        }
        
        DispatchQueue.main.async {
        self.tvMedicineDiseaseTableview.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.mDiseaseToMDetails{
            
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

extension MedicineDiseaseController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count >= 1{
            searchEnabled = true
            searchMedicinesAPIHit(searchString:textField.text!)
        }else{
            searchEnabled = false
            if medicinesArray.count == 0 {
                getMedicinesAPIHit(searchString: "")
            }
        }
        
        return true
    }
}

extension MedicineDiseaseController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchEnabled == true ? 1 : sectionHeadings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchEnabled == true ? self.medicinesArray.count : sectionRows[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineSearchTableViewCell.nameOfClass, for: indexPath) as! MedicineSearchTableViewCell
        cell.vSeparatorView.isHidden = true
        cell.lSubHeadingLabel.isHidden = true
        
        if searchEnabled == true {
            cell.lHeadingLabel.text = medicinesArray[indexPath.row].name!
            cell.lUnitPackLabel.isHidden = true
            tableView.rowHeight = 54
        }else{
            cell.lHeadingLabel.text = sectionValues[indexPath.section][indexPath.row].name!
            cell.lUnitPackLabel.isHidden = false
            if let unitPack = sectionValues[indexPath.section][indexPath.row].unitPack{
                cell.lUnitPackLabel.text = "Unit Pack: \(unitPack)"
            }else{
                cell.lUnitPackLabel.text = "Unit Pack: "
            }
            tableView.rowHeight = 84
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return searchEnabled == true ? "" : sectionHeadings[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.selectedSection = indexPath.section
        self.performSegue(withIdentifier: SegueIdentifiers.mDiseaseToMDetails, sender: nil)
    }

}
