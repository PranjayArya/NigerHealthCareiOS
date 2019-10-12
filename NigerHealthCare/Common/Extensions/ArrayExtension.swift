//
//  ArrayExtension.swift
//  Cross_Base_Framework
//
//  Created by Anurag Agnihotri on 19/08/16.
//  Copyright © 2016 RoundGlass Partners. All rights reserved.
//

import Foundation

extension Array {
    func firstObject() -> Element! {
        var firstItem: Element!
        if !self.isEmpty {
            firstItem = self[0]
        }
        return firstItem
    }
    
    func lastObject() -> Element! {
        var lastItem: Element!
        if !self.isEmpty {
            lastItem = self[self.count-1]
        }
        
        return lastItem
    }
    
    
    
    mutating func removeObject<U: Equatable>(_ object: U) {
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    self.remove(at: idx)
                    return
                }
            }
        }
        return 
    }
    
    
    func contains<T>(_ obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
