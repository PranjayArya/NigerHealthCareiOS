//
//  CollectionViewPresentable.swift
//  Reach
//
//  Created by Abhayam Rastogi on 01/08/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

protocol CollectionViewPresentable {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    var collectionViewBackgroundColor: UIColor { get }
    var collectionViewCellMinSpacing: CGFloat {get}

}

extension CollectionViewPresentable {
    var numberOfSections: Int { return 0 }
    var numberOfRows: Int { return 0 }
    var collectionViewBackgroundColor: UIColor { return Colors.backgroundGrey.color }
    var collectionViewCellMinSpacing: CGFloat { return 0 }
}
