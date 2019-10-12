//
//  BasicPlaceholderView.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 21/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

enum LoadingUIAppearance {
    case dark
    case light
    case blossom
}

class BasicPlaceholderView: UIView {
    
    let centerView: UIView = UIView()
    var title:String?
    
    init(frame: CGRect, title:String?) {
        self.title = title
        super.init(frame: frame)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
        setAppearance(style: .blossom)
    }
    
    func setAppearance(style: LoadingUIAppearance) {
    }

    func setupView() {
        backgroundColor = UIColor.white
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centerView)
        
        let views = ["centerView": centerView, "superview": self]
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[centerView]",
                                                          options: .alignAllCenterX,
                                                          metrics: nil,
                                                          views: views)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[centerView]",
                                                          options: .alignAllCenterY,
                                                          metrics: nil,
                                                          views: views)
        self.addConstraints(vConstraints)
        self.addConstraints(hConstraints)
    }
    
}
