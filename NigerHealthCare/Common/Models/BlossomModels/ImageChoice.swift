//
//  ImageChoice.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 18/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class ImageChoice: NSObject {
    
    //MARK: - Properties
    var normalStateImage:UIImage?
    var selectedStateImage:UIImage?
    var normalStateTitleColor:UIColor?
    var selectedStateTitleColor:UIColor?
    

    var text:String?
    var value:String?
    
    //MARK: - Initialization
    init(withNormalImage normal:UIImage?, selectedImage selected:UIImage?,normalTitleColor normalColor:UIColor? = nil, selectedTitleColor selectedColor:UIColor? = nil,text:String? = nil, value:String? = nil) {
        
        self.normalStateImage = normal
        self.selectedStateImage = selected
        self.normalStateTitleColor = normalColor
        self.selectedStateTitleColor = selectedColor
        self.text = text
        self.value = value
    }
}
