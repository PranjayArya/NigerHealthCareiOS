//
//  NotificationChannel.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct NotificationChannelModel {
    var id = ""
    var channel = ""
}

enum NotificationChannel {
    
    static let DEFAULT = "3"
    
    static let rowIds = ["1", "2", "3"]
    static let rowValues = ["Email", "Desktop", "Mobile"]
    
    static func getChannelIds() -> [String] {
        return rowIds
    }
    
    static func getChannels() -> [NotificationChannelModel] {
        var channels = [NotificationChannelModel]()
        for i in 0..<rowIds.count {
            var channel = NotificationChannelModel()
            channel.id = rowIds[i]
            channel.channel = rowValues[i]
            channels.append(channel)
        }
        return channels
    }
    
}
