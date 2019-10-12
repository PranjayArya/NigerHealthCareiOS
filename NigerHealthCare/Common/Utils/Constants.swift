//
//  Constants.swift
//  Reach
//
//  Created by DelTen Obino on 20/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: Any]
typealias MAX_MIN_DATE = (min:Date,max:Date)

struct Constants {
    static let userId = "user_id"
    static let corpId = "corp_id"
    static let visionId = "vision_id"
    static let barrierId = "barrier_id"
    static let categoryId = "category_id"
    static let userHabitId = "user_habit_id"
    static let userHabitBuddyId = "user_habit_buddy_id"
    static let friendUserId = "friend_user _id"
    static let userDareId = "user_dare_id"
    static let userGroupId = "user_group_id"
    static let obinoUIMode = "Reach_IOS"
    static let obinoAppVersion = "1"
    
    struct DBConstants {
        static let IDEAL_OR_NOT_STARTED = 0
        static let ACTIVE_OR_INPROGRESS = 1
        static let INACTIVE_OR_DEACTIVATED = 2
        static let COMPLETED_OR_DONE = 3
        static let PAUSED_OR_SUSPENDED = 4
    }
    
    //Date format constants
    struct Date {
        static let serverDateFormat = "yyyy-MM-dd"
        static let displayDateFormat = "dd-MM-yyyy"
        static let serverTimeFormat = "HH:mm:ss"
    }
    
    
    static let profileDefaultImage = "profile.png"
    
}

// ---------- cross patient ----------
/** HealthStat
 *  Service Tag String Constants.
 */

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

let kApplication_Id = "X-Application"
let kDeviceType = "X-DeviceType"
let kDeviceID = "X-DeviceID"
let kDeviceToken = "X-TOKEN"
let kCrossex_App_Id = "app_id"
let kXPatient = "X-Patient"
let kPatient_ID = "patient_id"
let kCorpId = "corporate_id"
let kAuthorization = "Authorization"
let kStatus = "status"
let kCrossDateDisplayFormat = "dd MMM, yyyy"
let kCrossTimeDisplayFormat = "h:mm a"



let kGoogleAPIKey = "AIzaSyC7ws3ewdi9EMDGAg6Vh2LHrOAHE34ETp0"
let kGoogleAutoCompleteAPI = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=%@&input=%@&language=en&components=country:in"
 let kGoogleGetLatLongPlaceAPI = "https://maps.googleapis.com/maps/api/place/details/json?placeid=%@&key=%@"

let kObservationTagTracker = "tracker"
let kObservationTag = "tag"

let kNoInternetConnectionTitle = "No Internet Connection"
let kNoInternetConnectionMessage = "Make sure your device is connected to the internet."

let kMixPanelUXScreenProperty = ["UX":"Screen"]
let kMixPanelUXTouchProperty = ["UX":"Touch"]
let kMixPanelUXActionProperty = ["UX":"Action"]

let kCrossDateTimeFormat = "yyyy-MM-dd"
let kDateDisplayFormat = "yyyy-MMM-dd"
let kCrossDateTimeDisplayFormat = "dd MMM, yyyy h:mm a"

let codeSetAPI = "/codeset/values?code="

public struct GenderConstants {
    
    static let Male = "Male"
    static let Female = "Female"
    
}

public struct BloodTypeConstants {
    static let APositive = "A+"
    static let ANegative = "A-"
    static let BPositive = "B+"
    static let BNegative = "B-"
    static let ABPositive = "AB+"
    static let ABNegative = "AB-"
    static let OPositive = "O+"
    static let ONegative = "O-"
}

let kButtonCornerRadius:CGFloat = 10
let kButtonBorderWidth:CGFloat = 1

public struct codeSetConstants {
    
    static let kCodeSet = "patient-marital-status,patient-occupation,patient-sleeping-hour,patient-yes-no-longer,patient-alcohol-habit,patient-exercise-habit,patient-duration-long,patient-exercise-duration,patient-condition-master,patient-surgical-procedure-history-master,patient-allergy-master,patient-vaccines,patient-family-medicalhistory"
    
}

let kCareCircleActiveUserHeight:CGFloat = 30


let googleClientId = "295755861212-76d198t31c2mjv7bjooq1h6su3nc2e9k.apps.googleusercontent.com"

let googleMapsId = "AIzaSyCRNtVLBDD1GnUn3wuZ9aSZjut5Hb_m0fQ"

struct SegueIdentifiers {
    
    static let splashToSignIn = "SplashToSignIn"
    static let splashToHome = "SplashToHome"
    static let criteriaToSignUp = "CriteriaToSignUp"
    static let signInToCriteria = "SignInToCriteria"
    static let signInToHome = "SignInToHome"
    static let signUpToHome = "SignUpToHome"
    static let ForgotPwdToResetPwd = "ForgotPwdToResetPwd"
    static let resetPwdToSignIn = "ResetPwdToSignIn"
    static let homeToMedicineName = "HomeToMName"
    static let homeToMedicineDisease = "HomeToMDisease"
    static let homeToMedicineCode = "HomeToMCode"
    static let homeToMedicineIdentifier = "HomeToMIdentifier"
    static let homeToStoreLocator = "HomeToSLocator"
    static let menuToSignIn = "MenuToSignIn"
    static let menuToProfile = "MenuToProfile"
    static let menuToSavedSearches = "MenuToSavedSearches"
    static let menuToAboutUs = "MenuToAboutUs"
    static let menuToMedicineList = "MenuToMedicineList"
    static let savedSearchesToMDetails = "SavedSearchesToMDetails"
    static let profileToChangePwd = "ProfileToChangePwd"
    static let mNameToMDetails = "MNameToMDetails"
    static let mDiseaseToMDetails = "MDiseaseToMDetails"
    static let mProductCodeToMDetails = "MProductCodeToMDetails"
    static let mListToMDetails = "MListToMDetails"
    static let menuToUpdateAvailability = "MenuToUpdateAvailability"
    static let uAvailablityToMDetails = "UAvailablityToMDetails"
    static let signUpToOTPController = "SignUpToOTPController"
    
}

enum CriteriaSelection:Int {
    case healthFacility = 0
    case others = 1
}





