//
//  FormSelector.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 26/05/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

@objc public protocol FormSelector: NSObjectProtocol {
    var formCell: FormBaseCell? { get set }
}
