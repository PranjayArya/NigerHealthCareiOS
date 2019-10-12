//
//  Coordinator.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


protocol Coordinator {
    var navigationController: BaseNavigationController? {get set}
    func start()
    func finish()
    func removeCoordinator(for key: String)
}

extension Coordinator {
    func removeCoordinator(for key: String) {}
}
