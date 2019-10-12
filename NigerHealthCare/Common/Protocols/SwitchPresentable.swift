//
//  SwitchPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 03/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol SwitchPresentable {
    var switchOn: Bool { get }
    var switchColor: UIColor { get }

    func onSwitchToggleOn(on: Bool)
}
