//
//  AboutUsController.swift
//  NigerHealthCare
//
//  Created by Pranjay on 24/05/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class AboutUsController:UIViewController{
    
    
    @IBOutlet weak var wvWebView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
     
        DispatchQueue.main.async {
            let url  = URL(string: "https://www.pamsteele.co.uk/about-us")!
            let urlReq = URLRequest(url: url)
            self.wvWebView.load(urlReq)
        }
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}
