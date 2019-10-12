//
//  BundleExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 05/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// load xib
    //  Usage: Set some UIView subclass as xib's owner class
    //  Bundle.loadNib("ViewXibName", owner: self) //some UIView subclass
    //  self.addSubview(self.contentView)
    public class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }
    
    /// load xib
    /// Usage: let view: ViewXibName = Bundle.loadNib("ViewXibName")
    public class func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
    public class var displayName: Any? {
        return self.main.object(forInfoDictionaryKey: kCFBundleNameKey as String)
    }
}
