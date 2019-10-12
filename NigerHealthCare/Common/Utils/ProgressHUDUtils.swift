//
//  ProgressHUDUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 09/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit
import SVProgressHUD

public enum ProgressHUDMaskType : UInt {
    
    case none // default mask type, allow user interactions while HUD is displayed
    case clear // don't allow user interactions
    case black // don't allow user interactions and dim the UI in the back of the HUD, as on iOS 7 and above
    case gradient // don't allow user interactions and dim the UI with a a-la UIAlertView background gradient, as on iOS 6
    case custom // don't allow user interactions and dim the UI in the back of the HUD with a custom color
}

struct ProgressHUD {
    
    static func show(status: String? = nil, maskType:ProgressHUDMaskType = .gradient){
        if status?.isBlank == true{
            SVProgressHUD.show()
        }else{
            SVProgressHUD.show(withStatus: status)
        }
        
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        
        switch maskType {
        case .none:
            SVProgressHUD.setDefaultMaskType(.none)
            
        case .clear: // don't allow user interactions
            SVProgressHUD.setDefaultMaskType(.clear)
            
        case .black: // don't allow user interactions and dim the UI in the back of the HUD, as on iOS 7 and above
            SVProgressHUD.setDefaultMaskType(.black)
            
        case .gradient: // don't allow user interactions and dim the UI with a a-la UIAlertView background gradient, as on iOS 6
            SVProgressHUD.setDefaultMaskType(.gradient)
            
        case .custom:
            SVProgressHUD.setDefaultMaskType(.custom)
        }
    }
    
    static func dismiss(){
        SVProgressHUD.dismiss()
    }
    
}
