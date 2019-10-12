//
//  BlockSwipe.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BlockSwipe: UISwipeGestureRecognizer {
    
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (direction: UISwipeGestureRecognizerDirection,
                             fingerCount: Int = 1,
                             action: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        self.direction = direction
        
        #if os(iOS)
            
            numberOfTouchesRequired = fingerCount
            
        #endif
        
        swipeAction = action
        addTarget(self, action: #selector(didSwipe(_:)))
    }
    
    @objc func didSwipe (_ swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
    
}
