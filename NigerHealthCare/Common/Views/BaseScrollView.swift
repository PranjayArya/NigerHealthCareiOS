//
//  BaseScrollView.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 30/09/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BaseScrollView: UIScrollView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .automatic
        }
    }

    func setZeroContentInset(){
        self.contentInset = UIEdgeInsets.zero
    }

    func setStandardContentInset(){
        self.contentInset = standardContentInsets
    }

    func setExtendedContentInset(){
        self.contentInset = extendedContentInsets
    }
}

extension BaseScrollView{
    
    var standardContentInsets:UIEdgeInsets{
        return UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }
    
    var extendedContentInsets:UIEdgeInsets{
        return UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
    }
}
