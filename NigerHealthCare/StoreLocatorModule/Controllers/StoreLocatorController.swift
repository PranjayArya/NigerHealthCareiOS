//
//  StoreLocatorController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 24/04/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import ObjectMapper



class StoreLocatorController:UIViewController,CLLocationManagerDelegate{
    
    
    //MARK:- OUTLETS
    @IBOutlet weak var vMapView: GMSMapView!
    @IBOutlet weak var cvStoreCollectionView: UICollectionView!
    @IBOutlet weak var tfSearchTextfield: UITextField!
    @IBOutlet weak var vListView: UIView!
    @IBOutlet weak var tvStoreTableView: UITableView!

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var storesArray = [HealthFacilityModel]()
    var directionsArray = [CLLocationCoordinate2D]()
    var storesNameHavingDirections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureLocationManager()
        configureTableView()
        tfSearchTextfield.delegate = self
 
    }
    
    func configureLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.vListView.isHidden = true
        delay(1.0) {
            self.locationManager.stopUpdatingLocation()
            self.getNearbyStoresAPIHit()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
            currentLocation = locationManager.location
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.lastObject()
        delay(0.15) {
           self.setMapToCurrentLocation()
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    @IBAction func menuBtnAction(_ sender: UIButton) {
       NotificationCenter.default.post(name: .menu, object: nil)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        if tfSearchTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter medicine/store name.", buttonTitle: "Ok", target: self)
            return
        }else{
            searchHealthFacility(query:tfSearchTextfield.text!)
        }
    }
    
    @IBAction func listBtnAction(_ sender: UIButton) {
        if self.vListView.isHidden == false {
            self.vListView.isHidden = true
        }else{
             self.vListView.isHidden = false
        }
    }

    
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    
    func configureTableView(){
        tvStoreTableView.delegate = self
        tvStoreTableView.dataSource = self
        tvStoreTableView.registerNib(StoreListTableViewCell.nameOfClass)
    }
    
    func configureCollectionView(){
        self.cvStoreCollectionView.delegate = self
        self.cvStoreCollectionView.dataSource = self
        let nib = UINib(nibName: StoreListCollectionViewCell.nameOfClass, bundle: nil)
        self.cvStoreCollectionView.register(nib, forCellWithReuseIdentifier: StoreListCollectionViewCell.nameOfClass)
    }
    
    func setMapToCurrentLocation(){
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: 13)
        vMapView?.camera = camera
        vMapView?.animate(to: camera)
    }
    
    
    func setMarkersOnMap(){
        
        for index in 0..<storesNameHavingDirections.count{
            let storeMarker = GMSMarker()
            storeMarker.position = CLLocationCoordinate2D(latitude: directionsArray[index].latitude, longitude: directionsArray[index].longitude)
            storeMarker.title = storesNameHavingDirections[index]
            storeMarker.snippet = "This is \(storesNameHavingDirections[index])"
            storeMarker.map = vMapView
        }
    }
    
    func searchHealthFacility(query:String){
        let queryParams  = ["query":query
                            ]
        
        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.searchHealthFacility(headers: headers, params: queryParams,successCallback: { (response) in
            
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
                    self.setMarkersOnMap()
                    self.cvStoreCollectionView.reloadData()
                    self.tvStoreTableView.reloadData()
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
    
    
    func getNearbyStoresAPIHit(){
        
        let queryParams  = ["lat":currentLocation.coordinate.latitude,
                            "lng":currentLocation.coordinate.longitude,
                            "distance":5000]

        let headers = ["Authorization":"\(AuthUtils.getAccessToken()!)"]
        
        NigerHealthCareService.getNearbyStores(headers: headers, params: queryParams, successCallback: { (response) in
            
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
                    self.setMarkersOnMap()
                    self.cvStoreCollectionView.reloadData()
                    self.tvStoreTableView.reloadData()
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
    
}

extension StoreLocatorController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.storesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:StoreListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreListCollectionViewCell.nameOfClass, for: indexPath) as! StoreListCollectionViewCell
        cell.delegate = self
        
        if let name = self.storesArray[indexPath.item].name{
            cell.lStoreNameLabel.text = name
        }
        
        if let location = self.storesArray[indexPath.item].lga{
            cell.lStoreLocationLabel.text = location
        }
        
        cell.lTimeLabel.text = "5 mins"
        
        if let _ = self.storesArray[indexPath.item].lat{
            
            if let _ = self.storesArray[indexPath.item].lng {
                
                cell.bDirectionsButton.isEnabled = true
                cell.bDirectionsButton.accessibilityIdentifier = cell.lStoreNameLabel.text
            }
            
        }else{
             cell.bDirectionsButton.isEnabled = false
        }
        
        cell.bCallButton.isEnabled = false
        cell.bDirectionsButton.tag = indexPath.item
        cell.bCallButton.tag = indexPath.item
        
        
        return cell
    }
    
}

extension StoreLocatorController:StoreListCollectionViewCellDelegate{
    
    func directionsBtnAction(index:Int) {
        
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
    
    
    func callBtnAction(index:Int) {
        
    }
}


extension StoreLocatorController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count >= 1{
            //searchEnabled = true
            searchHealthFacility(query: textField.text!)
        }else{
            //searchEnabled = false
            if storesArray.count == 0 {
                getNearbyStoresAPIHit()
            }
        }
        return true
    }
    
}

extension StoreLocatorController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTableViewCell.nameOfClass, for: indexPath) as! StoreListTableViewCell
        cell.delegate = self
        
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

extension StoreLocatorController:StoreListTableViewCellDelegate{
    
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
