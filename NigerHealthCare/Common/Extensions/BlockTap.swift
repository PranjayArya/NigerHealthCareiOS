//
//  BlockTap.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BlockTap: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTapsRequired = tapCount
        
        #if os(iOS)
            
            self.numberOfTouchesRequired = fingerCount
            
        #endif
        
        self.tapAction = action
        self.addTarget(self, action: #selector(didTap(_:)))
    }
    
    @objc func didTap (_ tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
    
}
