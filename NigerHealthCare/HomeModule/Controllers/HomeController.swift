//
//  HomeController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 16/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class HomeController: UIViewController {
    
    @IBOutlet weak var tfSearchTextfield: UITextField!
    @IBOutlet weak var tvHomeTableview: UITableView!
    
    let tableViewImages = ["1","2","3","4","5"]
    let tableViewData = ["Medicine by Name","Medicine by Disease","Medicine by Product Code","Medicine Identifier","Store Locator"]
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfSearchTextfield.delegate = self
        tvHomeTableview.delegate = self
        tvHomeTableview.dataSource = self
        tvHomeTableview.registerNib(HomeTableViewCell.nameOfClass)
        configureLocationManager()

    }
    
    
    func configureLocationManager(){
       // locationManager.delegate = self 
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        if tfSearchTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter medicine name/product code.", buttonTitle: "Ok", target: self)
            return
        }else{
              searchMedicinesAPIHit(searchString:tfSearchTextfield.text!)
        }
    }
    
    @IBAction func menuBtnAction(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: .menu, object: nil)
        
    }
    
    func searchMedicinesAPIHit(searchString:String){
        
        let queryParams = ["query":searchString]
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.searchMedicines(headers: headers, params: queryParams, successCallback: { (response) in
            
           // print(response)
            
        }, errorCallback: { (error) in
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }
    }
    
}

extension HomeController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.count < 2{
          searchMedicinesAPIHit(searchString:textField.text!)
        }
        
        return true
    }
}

extension HomeController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass, for: indexPath) as! HomeTableViewCell
        cell.ivCellImageView.image = UIImage.init(named: self.tableViewImages[indexPath.row])
        cell.lCellLabel.text = self.tableViewData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
        case 0:
            self.performSegue(withIdentifier: SegueIdentifiers.homeToMedicineName, sender: nil)
        case 1:
            self.performSegue(withIdentifier: SegueIdentifiers.homeToMedicineDisease, sender: nil)
        case 2:
            self.performSegue(withIdentifier: SegueIdentifiers.homeToMedicineCode, sender: nil)
        case 3:
            self.performSegue(withIdentifier: SegueIdentifiers.homeToMedicineIdentifier, sender: nil)
        default:
            self.performSegue(withIdentifier: SegueIdentifiers.homeToStoreLocator, sender: nil)
        }
        
    }
}
