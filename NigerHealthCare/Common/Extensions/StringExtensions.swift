//
//  StringExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 21/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

// swiftlint:disable identifier_name
extension String {

    var isPresent: Bool { return !isEmpty }

    func replace(_ string: String, with withString: String) -> String {
        return replacingOccurrences(of: string, with: withString)
    }

    func split(_ delimiter: String) -> [String] {
        let components = self.components(separatedBy: delimiter)
        return components != [""] ? components : []
    }

    /// Checks if string is empty or consists only of whitespace and newline characters
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.isEmpty
        }
    }

    /// Trims white space and new line characters
    public mutating func trim() {
        self = self.trimmed()
    }

    ///  Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var uppercaseFirstLetter: String {
        guard isPresent else { return self }

        var string = self
        string.replaceSubrange(string.startIndex...string.startIndex,
                               with: String(string[string.startIndex]).capitalized)

        return string
    }

    /// RG: Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }

    /// RG: Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }

    /// RG: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }

    /// RG: Converts String to Bool
    public func toBool() -> Bool? {
        let trimmedString = trimmed().lowercased()
        if trimmedString == "true" || trimmedString == "false" {
            return (trimmedString as NSString).boolValue
        }
        return nil
    }

    ///RG: Returns the first index of the occurency of the character in String
    public func getIndexOf(_ char: Character) -> Int? {
        for (index, c) in characters.enumerated() {
            if c == char {
                return index
            }
        }
        return nil
    }

    var ns: NSString {
        return self as NSString
    }
    var pathExtension: String? {
        return ns.pathExtension
    }
    var lastPathComponent: String? {
        return ns.lastPathComponent
    }

    var stringByDeletingLastPathComponent: String {
        get {
            return (self as NSString).deletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension
        }
    }
    var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents
        }
    }

    func heightForString(font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)
    }

    func widthForString(font: UIFont, height: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.width)
    }
    
    var crossImageUrl: String {
        let imageURL = APIConstants.CrossExchange.baseURL + "/getImage/\(self.replace("document?id=", with: ""))"
        return imageURL
    }
    
    var blossomImageUrl: String {
        let imageURL = APIConstants.Blossom.photoBaseURL + "/\(self)"
        return imageURL
    }

}
