//
//  AuthUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 20/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct AuthUtils {
    
    
    static func setUserName(userName: String) {
        UserDefaultsUtils.setString(userName, key: .userName)
    }
    
    static func getUserName() -> String? {
        return UserDefaultsUtils.getString(.userName)
    }
    
    static func setUserEmail(userEmail: String) {
        UserDefaultsUtils.setString(userEmail, key: .userEmail)
    }
    
    static func getUserEmail() -> String? {
        return UserDefaultsUtils.getString(.userEmail)
    }
    
    static func setUserImage(userImage: String) {
        UserDefaultsUtils.setString(userImage, key: .userImage)
    }
    
    static func getUserImage() -> String? {
        return UserDefaultsUtils.getString(.userImage)
    }
    
    static func setUserID(userID:String){
        UserDefaultsUtils.setString(userID, key: .userId)
    }
    
    static func getUserID() -> String? {
        return UserDefaultsUtils.getString(.userId)
    }
    
    static func setUserNumber(userNumber:String){
        UserDefaultsUtils.setString(userNumber, key: .userNumber)
    }
    
    static func getUserNumber() -> String? {
        return UserDefaultsUtils.getString(.userNumber)
    }
    
    static func setUserFirstName(userFirstName: String) {
        UserDefaultsUtils.setString(userFirstName, key: .userFirstName)
    }
    
    static func getUserFirstName() -> String? {
        return UserDefaultsUtils.getString(.userFirstName)
    }
    
    static func setUserLastName(userLastName: String) {
        UserDefaultsUtils.setString(userLastName, key: .userLastName)
    }
    
    static func getUserLastName() -> String? {
        return UserDefaultsUtils.getString(.userLastName)
    }
    
    static func setAccessToken(accessToken: String) {
        UserDefaultsUtils.setString(accessToken, key: .accessToken)
    }
    
    static func setHealthFacilityName(name:String){
        UserDefaultsUtils.setString(name, key: .userHealthFacilityName)
    }

    static func getHealthFacilityName() -> String? {
        return UserDefaultsUtils.getString(.userHealthFacilityName)
    }
    
    static func setHealthFacilityID(id:Int){
        UserDefaultsUtils.setObject(id as NSCoding, key: .userHealthFacilityId)
    }
    
    static func getHealthFacilityID() -> Int? {
        return UserDefaultsUtils.getObject(forKey: .userHealthFacilityId) as? Int
    }
    
    static func getAccessToken() -> String? {
        return UserDefaultsUtils.getString(.accessToken)
    }

    static func getUserId() -> String? {
        return getUserDetails()?.id
    }
    
    static func getCorpName() -> String? {
        let corporate = getCorporateDetails()
        return corporate?.name
    }

    static func getCorpId() -> String? {
        let corporate = getCorporateDetails()
        return corporate?.id
    }
    
    static func getCorporateLogoURL() -> String? {
        let corporate = getCorporateDetails()
        return corporate?.logo ?? ""
    }

    static func setHabitCreated(isHabitCreated: Bool) {
        UserDefaultsUtils.setBool(isHabitCreated, key: .isHabitCreated)
    }
    
    static func isHabitCreated() -> Bool {
        return UserDefaultsUtils.getBool(.isHabitCreated)
    }
    
    static func setCurrentParentID(parentID:Int){
         UserDefaultsUtils.setObject(parentID as NSCoding, key: .parentId)
    }
    
    static func getCurrentParentID() -> Int? {
        return UserDefaultsUtils.getObject(forKey: .parentId) as? Int
    }
    
    static func setCurrentChildID(childID: String){
         UserDefaultsUtils.setObject(childID as NSCoding, key: .childId)
    }
    
    static func getCurrentChildID() -> String? {
        return UserDefaultsUtils.getObject(forKey: .childId) as? String
    }
    
    static func setCurrentChild(child:Children){
        UserDefaultsUtils.setObject(child as NSCoding, key: .child)
    }
    
    static func getCurrentChild() -> Children? {
        return UserDefaultsUtils.getObject(forKey: .child) as? Children
    }
    
    static func setCurrentParent(parent: Parent){
        UserDefaultsUtils.setObject(parent as NSCoding, key: .parent)
    }
    
    static func getCurrentParent() -> Parent? {
        return UserDefaultsUtils.getObject(forKey: .parent) as? Parent
    }
    
    static func setActivites(activities: AnyObject) {
        return UserDefaultsUtils.setObject(activities as AnyObject as! NSCoding, key: .healthStatsActivityTypes)
    }
    
    static func getActivities() -> [String]? {
        return UserDefaultsUtils.getObject(forKey: .healthStatsActivityTypes) as? [String]
    }
    
    static func getUserProfileImageUrl() -> String? {
        return getUserDetails()?.profileImage
    }

    static func setEncryptedRefreshToken(refreshEncryptedToken: String) {
        UserDefaultsUtils.setString(refreshEncryptedToken, key: .refreshEncryptedToken)
    }
    
    static func getEncryptedRefreshToken() -> String? {
        return UserDefaultsUtils.getString(.refreshEncryptedToken)
    }
    
    static func getB2bCorp() -> Bool {
        let corporate = getCorporateDetails()
        return corporate?.b2bCorp ?? false
    }
    
    static func getCorporateFeatureDetails() -> [Features]? {
        let corporate = getCorporateDetails()
        return corporate?.features
    }
    
    static func setCorporateDetails(corporateDetails: Corporate) {
        UserDefaultsUtils.setObject(corporateDetails, key: .corporateDetails)
    }
    
    static func getCorporateDetails() -> Corporate? {
        return UserDefaultsUtils.getObject(forKey: .corporateDetails) as? Corporate
    }
    
    static func getServiceDomain() -> String? {
        let corporate = getCorporateDetails()
        return corporate?.serviceDomain
    }
    
    static func setUserDetails(userDetails: ReachUser) {
        UserDefaultsUtils.setObject(userDetails, key: .userDetails)
    }
    
    static func getUserDetails() -> ReachUser? {
        return UserDefaultsUtils.getObject(forKey: .userDetails) as? ReachUser
    }
    
    static func setHabitStatus(status:Int){
        UserDefaultsUtils.setInt(status, key: .habitStatus)
    }
    
    static func getHabitStatus() -> Int? {
        return UserDefaultsUtils.getInt(.habitStatus)
    }
    
    static func invalidate() {
        UserDefaultsUtils.clearUserDefaults()
    }
}
