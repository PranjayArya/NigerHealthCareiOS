//
//  UserDefaultsUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 20/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
 
public struct UserDefaultsUtils {

    public enum ReservedKey: String {
        case userName = "userName"
        case userImage = "userImage"
        case userNumber = "userNumber"
        case userEmail = "userEmail"
        case userId    = "userId"
        case userHealthFacilityName = "userHealthFacilityName"
        case userHealthFacilityId = "userHealthFacilityId"
        case userFirstName = "userFirstName"
        case userLastName = "userLastName"
        case accessToken = "reachAccessToken"
        case isHabitCreated = "isHabitCreated"
        case parent = "parent"
        case child = "child"
        case parentId = "parentId"
        case childId = "childId"
        case healthStatsActivityTypes = "HealthStatsActivityTypes"
        case address  = "address"
        case latitude       = "latitude"
        case longitude  = "longitude"
        case refreshEncryptedToken = "reachEncryptedRefreshToken"
        case reminderTimes = "reminderTimes"
        case reminderChannels = "reminderChannels"
        case corporateDetails = "corporateDetails"
        case calorieTrackerGoal = "calorieTrackerGoal"
        case userDetails = "userDetails"
        case habitStatus = "habitStatus"
        case appToken =   "appToken"
        case fcmToken = "fcmToken"
        case stepValue = "stepValue"
        case stepsTrack = "stepsTrack"
    }

    /**
     Function for getting the bool value corresponding to a key from NSUserDefaults.
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
    public static func getBool(_ key: ReservedKey) -> Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: key.rawValue)
    }

    /**
     Function for setting the bool value for corresponding key in NSUserDefaults.
     
     - parameter value: <#value description#>
     - parameter key:   <#key description#>
     */
    public static func setBool(_ value: Bool, key: ReservedKey) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()

    }

    /**
     Function for setting the Int value for corresponding key in NSUserDefaults.
     
     - parameter value: <#value description#>
     - parameter key:   <#key description#>
     */
    public static func setInt(_ value: Int, key: ReservedKey) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }

    /**
     Function for getting the Int value for corresponding key in NSUserDefaults.
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
    public static func getInt(_ key: ReservedKey) -> Int? {
        let userDefaults = UserDefaults.standard
        return userDefaults.integer(forKey: key.rawValue)
    }
    
    /**
     Function for setting the Float value for corresponding key in NSUserDefaults.
     
     - parameter value: <#value description#>
     - parameter key:   <#key description#>
     */
    public static func setFloat(_ value: Float, key: ReservedKey) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    /**
     Function for getting the Float value for corresponding key in NSUserDefaults.
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
    public static func getFloat(_ key: ReservedKey) -> Float? {
        let userDefaults = UserDefaults.standard
        return userDefaults.float(forKey: key.rawValue)
    }

    /// <#Description#>
    ///
    /// - Parameter key: <#key description#>
    /// - Returns: <#return value description#>
    public static func getString(_ key: ReservedKey) -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: key.rawValue)
    }

    /// <#Description#>
    ///
    /// - Parameters:
    ///   - value: <#value description#>
    ///   - key: <#key description#>
    public static func setString(_ value: String, key: ReservedKey) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }

    /**
     Function used to set an object for corresponding key in NSUserDefaults.
     
     - parameter value: <#value description#>
     - parameter key:   <#key description#>
     */
    public static func setObject(_ value: NSCoding, key: ReservedKey) {
        let encoded = NSKeyedArchiver.archivedData(withRootObject: value)

        let userDefaults = UserDefaults.standard
        userDefaults.set(encoded, forKey: key.rawValue)
        userDefaults.synchronize()
    }

    /**
     Function used to get an object for corresponding key from NSUserDefaults.
     
     - parameter key: <#key description#>
     
     - returns: <#return value description#>
     */
    public static func getObject(forKey key: ReservedKey) -> AnyObject? {
        let userDefaults = UserDefaults.standard

        if let encoded = userDefaults.object(forKey: key.rawValue) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: encoded) as AnyObject
        }

        return nil
    }

    public static func setArray(_ value: [Any], key: ReservedKey) {
        let encoded = NSKeyedArchiver.archivedData(withRootObject: value)

        let userDefaults = UserDefaults.standard
        userDefaults.set(encoded, forKey: key.rawValue)
        userDefaults.synchronize()

    }

    public static func getArray(forKey key: ReservedKey) -> [Any]? {
        let userDefaults = UserDefaults.standard

        if let encoded = userDefaults.object(forKey: key.rawValue) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: encoded) as? [Any]
        }

        return nil
    }

    /**
     Method to clear User Defaults.
     */
    public static func clearUserDefaults() {

        // Because UserDefaults.resetStandardUserDefaults() didn't do the job.
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
}
