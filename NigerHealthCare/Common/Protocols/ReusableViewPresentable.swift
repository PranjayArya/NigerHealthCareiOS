//
//  ReusableViewPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 08/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol ReusableViewPresentable {

    static func registerReusableView(collectionView: UICollectionView)
    func reusableViewInstance<T: UICollectionReusableView>(collectionView: UICollectionView, indexPath: IndexPath, kind: String) -> T
}
