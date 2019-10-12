//
//  Constraints.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 18/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

//MARK: Constraints
public struct Constraint{
    
    public static func pinSubview(subview:UIView?,superView:UIView,
                                  attribute:NSLayoutAttribute,constant:CGFloat){
        
        superView.addConstraint(NSLayoutConstraint(item: superView,
                                                   attribute: attribute, relatedBy: NSLayoutRelation.equal,
                                                   toItem: subview, attribute: attribute, multiplier: 1.0,
                                                   constant: constant))
        
    }
    
    public static func pinAllEdgesOfSubview(subview:UIView,superView:UIView){
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.bottom,constant:0.0)
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.top,constant:0.0)
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.leading,constant:0.0)
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.trailing,constant:0.0)
    }
    
    public static func pinCenterOfSubview(subview:UIView,superView:UIView){
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.centerX,constant:0.0)
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.centerY,constant:0.0)
    }
    
    public static func subviewHeight(subview:UIView,superView:UIView, constant:CGFloat){
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.height,constant:constant)
    }
    
    public static func subviewWidth(subview:UIView,superView:UIView, constant:CGFloat){
        pinSubview(subview: subview, superView: superView, attribute: NSLayoutAttribute.width,constant:constant)
    }
}
