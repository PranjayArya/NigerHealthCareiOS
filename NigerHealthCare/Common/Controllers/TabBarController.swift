//
//  TabBarController.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

protocol TabBarControllerDelegate: class {
    func doubleTapOnTabBar()
}

class TabBarController: UITabBarController {

    weak var tabDelegate: TabBarControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doDoubleTapTabbar))
        doubleTap.numberOfTapsRequired = 2

        self.tabBar.addGestureRecognizer(doubleTap)
    }

    @objc func doDoubleTapTabbar() {
        print("Double tab \(self.selectedIndex)")
        tabDelegate?.doubleTapOnTabBar()
    }
}
