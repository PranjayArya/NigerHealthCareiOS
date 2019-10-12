//
//  BlockLongPress.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class BlockLongPress: UILongPressGestureRecognizer {
    
    private var longPressAction: ((UILongPressGestureRecognizer) -> Void)?
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UILongPressGestureRecognizer) -> Void)?) {
        self.init()
        longPressAction = action
        addTarget(self, action: #selector(didLongPressed(_:)))
    }
    
    @objc func didLongPressed(_ longPress: UILongPressGestureRecognizer) {
        if longPress.state == UIGestureRecognizerState.began {
            longPressAction?(longPress)
        }
    }
    
}
