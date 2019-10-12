//
//  VideoUtils.swift
//  Reach
//
//  Created by Shivam Dhingra on 05/03/19.
//  Copyright © 2019 RoundGlass. All rights reserved.
//

import Foundation
import AVKit

class VideoUtils {
    static func getPlayerViewController(forVideoFilePath: String?) -> AVPlayerViewController?{
        if let path = forVideoFilePath{
            let videoPathUrl = URL(fileURLWithPath: path)
            let player = AVPlayer(url: videoPathUrl)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            return playerViewController
        }
        return nil
    }
}

