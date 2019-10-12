//
//  SignUpController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 16/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit


class SignUpController: UIViewController {
    
    
    @IBOutlet weak var tfNameTextfield: UITextField!
    @IBOutlet weak var tfEmailTextfield: UITextField!
    @IBOutlet weak var tfPhoneTextfield: UITextField!
    @IBOutlet weak var tfHealthFacilityTextfield: UITextField!
    @IBOutlet weak var tfPasswordTextfield: UITextField!
    @IBOutlet weak var tfRePasswordTextfield: UITextField!
    @IBOutlet weak var bTogglePasswordBtn: UIButton!
    @IBOutlet weak var bToggleRePasswordBtn: UIButton!
    
    @IBOutlet weak var tfSearchTextField: UITextField!
    
    @IBOutlet weak var cHealthFacilityConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bShowBtn: UIButton!
    
    @IBOutlet weak var vPopUpVIew: UIView!
    
    @IBOutlet weak var tvHealthFaciltyTableView: UITableView!
    
    var storesArray = [HealthFacilityModel]()
    
    var selectedId = 0
    
     var selectedCriteria:CriteriaSelection!
    
    @IBAction func closeBtnAction(_ sender: Any) {
        vPopUpVIew.isHidden  = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNameTextfield.delegate = self
        tfEmailTextfield.delegate = self
        tfPhoneTextfield.delegate = self
        tfHealthFacilityTextfield.delegate = self
        tfPasswordTextfield.delegate = self
        tfRePasswordTextfield.delegate = self
        tfSearchTextField.delegate = self
        tfHealthFacilityTextfield.isUserInteractionEnabled = false
        
        tvHealthFaciltyTableView.delegate = self
        tvHealthFaciltyTableView.dataSource = self
        tvHealthFaciltyTableView.registerNib(ColorShapeTableViewCell.nameOfClass)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        vPopUpVIew.isHidden  = true
        
        if selectedCriteria.hashValue == 0 { // HF ON
            
            self.getHealthFacilities()
            tfHealthFacilityTextfield.isHidden = false
            cHealthFacilityConstraint.constant = 80
            bShowBtn.isHidden = false
            
            
        }else{ // Others
            
            tfHealthFacilityTextfield.isHidden = true
            cHealthFacilityConstraint.constant = 20
            bShowBtn.isHidden = true
        }

    }
    
    
    @IBAction func searchHealthFacility(_ sender: Any) {
        
        if tfSearchTextField.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter health facility name.", buttonTitle: "Ok", target: self)
            return
        }else{
            searchHealthFacilities(searchString:tfSearchTextField.text!)
        }
    }
    
    
    
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        let _ =  self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func showHealthFacilityBtnAction(_ sender: Any) {
        self.vPopUpVIew.isHidden = false
        self.tvHealthFaciltyTableView.reloadData()
    }
    
    @IBAction func togglePasswordBtnAction(_ sender: UIButton) {
        
        if sender.tag == 0{
            if tfPasswordTextfield.isSecureTextEntry {
                tfPasswordTextfield.isSecureTextEntry = false
                bTogglePasswordBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfPasswordTextfield.isSecureTextEntry = true
                bTogglePasswordBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }else{
            if tfRePasswordTextfield.isSecureTextEntry {
                tfRePasswordTextfield.isSecureTextEntry = false
                bToggleRePasswordBtn.setImage(UIImage.init(named: "hidePwd"), for: .normal)
            }else{
                tfRePasswordTextfield.isSecureTextEntry = true
                bToggleRePasswordBtn.setImage(UIImage.init(named: "showPwd"), for: .normal)
            }
        }
        
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        
        if tfNameTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your name.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfNameTextfield.text!.count <= 3{
            ValidationUtils.showAlertViewController(title: "Error", message: "Name should be atleast 3 characters long.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfEmailTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your email.", buttonTitle: "Ok", target: self)
            return
        }
        
        if ValidationUtils.isValidEmail(tfEmailTextfield.text!) == false{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter vaild email.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPhoneTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your phone number.", buttonTitle: "Ok", target: self)
            return
        }

        if ValidationUtils.isValidTenDigitPhoneNumber(tfPhoneTextfield.text!) == false{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter vaild phone number.", buttonTitle: "Ok", target: self)
            return
        }
        
         if selectedCriteria.hashValue == 0 {
                    if tfHealthFacilityTextfield.text!.isEmpty{
                        ValidationUtils.showAlertViewController(title: "Error", message: "Please select your health facility.", buttonTitle: "Ok", target: self)
                        return
                    }
         }
        

        
        if tfPasswordTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPasswordTextfield.text!.count <= 5{
            ValidationUtils.showAlertViewController(title: "Error", message: "Password should have atleast characters.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfRePasswordTextfield.text!.isEmpty{
            ValidationUtils.showAlertViewController(title: "Error", message: "Please re-enter your password.", buttonTitle: "Ok", target: self)
            return
        }
        
        if tfPasswordTextfield.text! != tfRePasswordTextfield.text!{
            ValidationUtils.showAlertViewController(title: "Error", message: "Passwords does not match.", buttonTitle: "Ok", target: self)
            return
        }
        
        
        
        //SIGN UP API HIT
        let body:RequestBody = [ "email": tfEmailTextfield.text!,
                                 "password": tfPasswordTextfield.text!,
                                 "name": tfNameTextfield.text!,
                                 "phone":tfPhoneTextfield.text!,
                                 "image":"/imageUrl",
                                 "address":"New york",
                                 "health_facility_code":"\(self.selectedId)"
                                ]
        
        ProgressHUD.show()
        
        NigerHealthCareService.userSignUp(body: body, successCallback: { (response) in
                ProgressHUD.dismiss()
          
            print(response)
            
            self.performSegue(withIdentifier: SegueIdentifiers.signUpToOTPController, sender: nil)
            
        }, errorCallback: { (error) in
             ProgressHUD.dismiss()
            
             print(error.description)
            
            ValidationUtils.showAlertViewController(title: "Error", message: "Something went wrong", buttonTitle: "Ok", target: self)
            return
        }) {
             ProgressHUD.dismiss()
            ValidationUtils.showAlertViewController(title: "Error", message: "Please check your internet connection", buttonTitle: "Ok", target: self)
            return
        }

    }
    
    func getHealthFacilities(){
        
        let params = ["page":0,
                      "size":500]
        
        NigerHealthCareService.openHealthFacility(params: params, successCallback: { (response) in
            if let responseArray = response {
                
                self.storesArray.removeAll()
                
                
                for obj in responseArray{
                    let storesObj = HealthFacilityModel(JSON: obj)
                    self.storesArray.append(storesObj!)
                }
                
                DispatchQueue.main.async {
                    self.tvHealthFaciltyTableView.reloadData()
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
    
    
    func searchHealthFacilities(searchString:String){
        
        let params = [ "query":searchString,
                      "page":0,
                      "size":500
            ] as [String : Any]
        
        NigerHealthCareService.openSearchHealthFacility(params: params, successCallback: { (response) in
            if let responseArray = response {
                
                self.storesArray.removeAll()
                
                
                for obj in responseArray{
                    let storesObj = HealthFacilityModel(JSON: obj)
                    self.storesArray.append(storesObj!)
                }
                
                DispatchQueue.main.async {
                    self.tvHealthFaciltyTableView.reloadData()
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


extension SignUpController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == tfSearchTextField {
            
            if textField.text!.count >= 1{
                searchHealthFacilities(searchString:textField.text!)
            }else{
                
                if storesArray.count == 0 {
                    getHealthFacilities()
                }
            }
        }
        return true
    }
}

extension SignUpController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorShapeTableViewCell.nameOfClass, for: indexPath) as! ColorShapeTableViewCell
        
        cell.cNameLabelConstraint.constant = 25
        cell.lNameLabel.text = self.storesArray[indexPath.row].name!
        cell.ivImageView.isHidden = true
        cell.bSelectBtn.tag = indexPath.row
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOff"), for: .normal)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ColorShapeTableViewCell
        cell.bSelectBtn.setImage(UIImage.init(named: "radioBtnOn"), for: .normal)
        
        tfHealthFacilityTextfield.text = self.storesArray[ indexPath.row].name!
        self.selectedId = self.storesArray[indexPath.row].id!
        self.vPopUpVIew.isHidden = true
    }
    
}


