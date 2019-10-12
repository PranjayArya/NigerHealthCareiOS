//
//  UICollectionReusableViewExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 25/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    public static var nibName: String {
        return self.nameOfClass
    }
    
    public static var reuseIdentifier: String {
        return self.nameOfClass
    }
}
