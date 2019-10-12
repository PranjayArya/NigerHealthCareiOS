//
//  CollectionViewCellPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 28/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol CollectionViewCellPresentable {

    static func registerCell(collectionView: UICollectionView)
    func cellInstance<T: UICollectionViewCell>(collectionView: UICollectionView, indexPath: IndexPath) -> T
}
