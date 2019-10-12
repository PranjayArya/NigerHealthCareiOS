//
//  ChoiceButton.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 20/03/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class ChoiceButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.gibsonFont(type: .Regular, size: .ExSmall)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.alignCenter()
    }
}

extension UIButton{
    
    func alignCenter(spacing: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
       self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: 0.0, right: 0.0)
        
       let labelString = NSString(string: text)
       let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        
        if AppUtils.screenHeight <= 568{
            self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right:0)
        }else{
            self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    
    }
    
}
