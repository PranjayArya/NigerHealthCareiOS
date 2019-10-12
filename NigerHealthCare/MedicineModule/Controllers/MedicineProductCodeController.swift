//
//  MedicineProductCodeController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit

class MedicineProductCodeController: UIViewController {
    
    @IBOutlet weak var tfSearchTextfield: UITextField!
    @IBOutlet weak var tvMedicineProductCodeTableview: UITableView!
    
    
    var selectedIndex = 0
    var selectedSection = 0
    
    var medicinesArray = [MedicineModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfSearchTextfield.delegate = self
        tvMedicineProductCodeTableview.delegate = self
        tvMedicineProductCodeTableview.dataSource = self
        tvMedicineProductCodeTableview.registerNib(MedicineSearchTableViewCell.nameOfClass)
        getMedicinesAPIHit(searchString:"")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        if tfSearchTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter product code.", buttonTitle: "Ok", target: self)
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
            
            print(response)
            
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
                           "sort":"code,asc"] as [String : Any]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.getMedicines(headers: headers, params: queryParams, successCallback: { (response) in
            
            if let dict = response {
                
                self.medicinesArray.removeAll()
                
                if let responseArray = dict["content"] as? [NSDictionary]{
                    
                    for obj in responseArray {
                        let medicineObj = MedicineModel(JSON: obj as! [String:AnyObject])
                        self.medicinesArray.append(medicineObj!)
                    }
                    
                    DispatchQueue.main.async {
                        self.tvMedicineProductCodeTableview.reloadData()
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.mProductCodeToMDetails{
            
            let medicineDetailObj = segue.destination as! MedicineDetailController
            
//           // if searchEnabled == false{
//                medicineDetailObj.medicineModel = sectionValues[selectedSection][selectedIndex]
////            }else{
               medicineDetailObj.medicineModel = self.medicinesArray[selectedIndex]
//            }
            
            medicineDetailObj.fromBookmarked = false
            
            
        }
        
    }
    
}

extension MedicineProductCodeController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count < 2{
            searchMedicinesAPIHit(searchString:textField.text!)
        }
        
        return true
    }
}

extension MedicineProductCodeController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicinesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineSearchTableViewCell.nameOfClass, for: indexPath) as! MedicineSearchTableViewCell
        cell.lHeadingLabel.text = medicinesArray[indexPath.row].code!
        cell.lSubHeadingLabel.text = medicinesArray[indexPath.row].name!
        cell.lUnitPackLabel.isHidden = true
        tableView.rowHeight = 54
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.selectedSection = indexPath.section
        self.performSegue(withIdentifier: SegueIdentifiers.mProductCodeToMDetails, sender: nil)
    }
}
