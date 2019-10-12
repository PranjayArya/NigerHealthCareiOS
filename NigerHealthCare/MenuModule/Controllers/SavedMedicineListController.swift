//
//  SavedMedicineListController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 20/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class SavedMedicineListController:UIViewController{
    
    //MARK:- OUTLETS
    @IBOutlet weak var medicineStoreTableView: UITableView!
    
    @IBOutlet weak var scSegmentedControl: UISegmentedControl!
    
    
    //MARK:- VARAIBLES
    var storesArray = [HealthFacilityModel]()
    var directionsArray = [CLLocationCoordinate2D]()
    var storesNameHavingDirections = [String]()
    var medicinesArray = [MedicineModel]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getHealthFacilities()
        getBookmarkedMedicines()
    }
    
    func  configureTableView(){
        medicineStoreTableView.delegate = self
        medicineStoreTableView.dataSource = self
        medicineStoreTableView.registerNib(StoreListTableViewCell.nameOfClass)
        medicineStoreTableView.registerNib(MedicineListTableViewCell.nameOfClass)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func segmentControlAction(_ sender: Any) {
        medicineStoreTableView.reloadData()
    }
    
    
    func getBookmarkedMedicines(){
        
        let id  = AuthUtils.getUserID()!
        
        let params = ["user_id": id ]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.getBookmarkedMedicine(headers: headers, params: params, successCallback: { (response) in
            
            if let dict = response {
                
                self.medicinesArray.removeAll()
                
                if let responseArray = dict["content"] as? [NSDictionary]{
                    
                    for obj in responseArray {
                        let medicineObj = MedicineModel(JSON: obj as! [String:AnyObject])
                        self.medicinesArray.append(medicineObj!)
                        print(medicineObj!.name!)
                    }
                    
                    DispatchQueue.main.async {
                        self.medicineStoreTableView.reloadData()
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
    
    
    
    func getHealthFacilities(){
        
         let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.getHealthFacilities(headers: headers, successCallback: { (response) in
            
            if let responseArray = response {
                
                self.storesArray.removeAll()
                self.directionsArray.removeAll()
                self.storesNameHavingDirections.removeAll()
               
                for obj in responseArray{
                    let storesObj = HealthFacilityModel(JSON: obj)
                    self.storesArray.append(storesObj!)
                }
                
                for store in self.storesArray{
                    if let lat = store.lat{
                        if let long = store.lng {
                            let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: long)
                            self.directionsArray.append(coordinates)
                            self.storesNameHavingDirections.append(store.name!)
                        }
                    }
                }

                DispatchQueue.main.async {
                  self.medicineStoreTableView.reloadData()
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
        
        if segue.identifier == SegueIdentifiers.savedSearchesToMDetails{
            
            let medicineDetailObj = segue.destination as! MedicineDetailController
            medicineDetailObj.medicineModel = self.medicinesArray[selectedIndex]
            medicineDetailObj.fromBookmarked = true
            
            
        }
        
        
    }
    
    
    
    
    
}

extension SavedMedicineListController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scSegmentedControl.selectedSegmentIndex == 0 ? self.medicinesArray.count : self.storesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if scSegmentedControl.selectedSegmentIndex == 0{
            
              let cell = tableView.dequeueReusableCell(withIdentifier: MedicineListTableViewCell.nameOfClass, for: indexPath) as! MedicineListTableViewCell
            cell.delegate = self
            cell.selectionStyle = .none
            
            cell.bBookmarkBtn.tag = indexPath.row
            cell.bBookmarkBtn.setImage(UIImage.init(named: "bMarkDone"), for: .normal)
            
            if let name = self.medicinesArray[indexPath.row].name {
                cell.lMedicineLabel.text = name
            }
            
            
            if let price = self.medicinesArray[indexPath.row].price {
                cell.lPriceLabel.text = "\(price)"
            }else{
                cell.lPriceLabel.text = ""
            }
            
            cell.lCompositionLabel.text = ""
            
            if let uses = self.medicinesArray[indexPath.row].uses {
                cell.lUsesLabel.text = uses
            }else{
                cell.lUsesLabel.text = ""
            }
            
            return cell
            
            
        }else{
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTableViewCell.nameOfClass, for: indexPath) as! StoreListTableViewCell
        cell.delegate = self
        cell.selectionStyle = .none
        
        if let name = self.storesArray[indexPath.row].name{
            cell.lStoreNameLabel.text = name
        }
        
        if let location = self.storesArray[indexPath.row].lga{
            cell.lStoreLocationLabel.text = location
        }
        
        cell.lTimeLabel.text = "5 mins"
        
        cell.lStatusLabel.text = "Open now"
        
        if let _ = self.storesArray[indexPath.row].lat{
            
            if let _ = self.storesArray[indexPath.row].lng {
                
                cell.bDirectionsBtn.isEnabled = true
                cell.bDirectionsBtn.accessibilityIdentifier = cell.lStoreNameLabel.text
            }
            
        }else{
            cell.bDirectionsBtn.isEnabled = false
        }
        
        cell.bCallBtn.isEnabled = false
        cell.bDirectionsBtn.tag = indexPath.row
        cell.bCallBtn.tag = indexPath.row
         
        return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if scSegmentedControl.selectedSegmentIndex == 0 {
            self.selectedIndex = indexPath.row
            self.performSegue(withIdentifier: SegueIdentifiers.savedSearchesToMDetails, sender: nil)
        }
    }
    
}

extension SavedMedicineListController:StoreListTableViewCellDelegate{
    
    func listDirectionsBtnAction(index: Int) {
        let storeName = self.storesArray[index].name!
        
        let directionIndex = self.storesNameHavingDirections.index(of: storeName)!
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            
            let url = NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(self.directionsArray[directionIndex].latitude),\(self.directionsArray[directionIndex].longitude)&directionsmode=driving")! as URL
            let options = ["":""]
            UIApplication.shared.open(url, options: options) { (_) in
                
            }
            
        } else {
            NSLog("Can't use comgooglemaps://");
        }
    }
    
    func listCallBtnAction(index: Int) {
        
    }
    
    func listBookmarkedBtnAction(index: Int) {
        
    }
    
    
}

extension SavedMedicineListController:MedicineListTableViewCellDelegate{
    
    func medicineBookmarkedBtnAction(index: Int) {
        
        let id  = AuthUtils.getUserID()!
        let medicineId = self.medicinesArray[index].id!
        let params = ["user_id": id ,
                      "medicine_id": "\(medicineId)"
                      ]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.unbookmarkMedicine(headers: headers, params: params, successCallback: { (response) in
            DispatchQueue.main.async {
                self.getBookmarkedMedicines()
            }
        }, errorCallback: { (error) in
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
        
    }
    
}
