//
//  TableViewCellPresentable.swift
//  Reach
//
//  Created by Abhayam Rastogi on 01/08/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

protocol TableViewCellPresentable {
    
    static func registerCell(tableView: UITableView)
    
    func cellInstance<T: UITableViewCell>(tableView: UITableView, indexPath: IndexPath) -> T
}
