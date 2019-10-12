//
//  BlockPinch.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BlockPinch: UIPinchGestureRecognizer {
    
    private var pinchAction: ((UIPinchGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UIPinchGestureRecognizer) -> Void)?) {
        self.init()
        self.pinchAction = action
        self.addTarget(self, action: #selector(didPinch(_:)))
    }
    
    @objc func didPinch (_ pinch: UIPinchGestureRecognizer) {
        pinchAction? (pinch)
    }
    
}
