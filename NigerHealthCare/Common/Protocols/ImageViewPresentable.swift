//
//  ImageViewPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 03/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol ImageViewPresentable {
    var imageName: String? { get }
    var placeholderImage: String? { get }
    var imageURL: URL? { get }
    var image: UIImage? { get }
    var imageViewContentMode: UIViewContentMode? { get }
}

extension ImageViewPresentable {
    
    var imageName: String? { return nil }
    var imageURL: URL? { return nil }
    var image: UIImage? { return nil }
    var placeholderImage: String? { return nil }
    var imageViewContentMode: UIViewContentMode? { return .scaleAspectFit }

}

