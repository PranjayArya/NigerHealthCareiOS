//
//  HealthStatsFlowLayout.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 13/12/16.
//  Copyright © 2016 RoundGlass Partners. All rights reserved.
//

import UIKit
import IQDropDownTextField

class HealthStatsFlowLayout: UICollectionViewFlowLayout {

  //MARK: Constants
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
   
    let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
    var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
    
    // use a value to keep track of left margin
    var leftMargin: CGFloat = 0.0;
    
    for attributes in attributesForElementsInRect! {
      let refAttributes = attributes 
      // assign value if next row
      if (refAttributes.frame.origin.x == self.sectionInset.left) {
        leftMargin = self.sectionInset.left
      } else {
        // set x position of attributes to current margin
        var newLeftAlignedFrame = refAttributes.frame
        
        if (leftMargin + refAttributes.frame.size.width + 8) >= self.collectionViewContentSize.width{
            leftMargin = ScreenSize.SCREEN_WIDTH/2.0 - refAttributes.frame.size.width/2
        }
        newLeftAlignedFrame.origin.x = leftMargin
        refAttributes.frame = newLeftAlignedFrame
      }
      // calculate new value for current margin
        
       leftMargin += refAttributes.frame.size.width + 8
    
      newAttributesForElementsInRect.append(refAttributes)
    }
    
    return newAttributesForElementsInRect
  }
}

