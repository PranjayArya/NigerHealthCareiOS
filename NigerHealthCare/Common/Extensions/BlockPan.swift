//
//  BlockPan.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BlockPan: UIPanGestureRecognizer {
    
    private var panAction: ((UIPanGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.panAction = action
        self.addTarget(self, action: #selector(didPan(_:)))
    }
    
    @objc func didPan (_ pan: UIPanGestureRecognizer) {
        panAction? (pan)
    }
    
}
