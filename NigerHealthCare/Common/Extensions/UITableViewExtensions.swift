//
//  UITableViewExtensions.swift
//  Reach
//
//  Created by DelTen Obino on 19/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

// swiftlint:disable force_cast
extension UITableView {

    func registerNib(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

    func dequeueCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }

}
