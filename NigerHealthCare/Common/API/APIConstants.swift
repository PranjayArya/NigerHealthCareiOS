//
//  APIConstants.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

/**
 *  API String Constants Defining BaseURL and Other API URL Paths.
 */
public struct APIConstants {

    
    struct NigerHealthCare{
        //Base URL
        static let baseURL = "https://nigerhealthcare.herokuapp.com/v1"
        
        //API path
        static let loginAPI =         "/api/core/login"
        static let signUpAPI =      "/api/core/users"
        static let socialLoginSignUp = "/api/core/social_login"
        static let getContext = "/api/core/context"
        static let getMedicine = "/medication/medicines"
        static let searchMedicine = "/medication/search"
        static let getNearbyStores = "/health_facility/nearby_stores"
        static let getHealthFacilities = "/health_facility"
        static let getBookmarkedMedicines = "/medication/user_medicine"
        static let bookmarkMedicine = "/medication/bookmark_medicine"
        static let removeBookmarkedMedicine = "/medication/unbookmark_medicine"
        static let changePassword = "/api/core/users/%@/password"
        static let forgotPassword = "/api/core/forgot-password"
        static let getMedicineFromFacility = "/health_facility/medicine"
        static let addMedicineForFacility = "/health_facility/add_medicine"
        static let removeMedicineForFacility = "/health_facility/remove_medicine"
        static let searchHealthFacility = "/health_facility/search"
        static let getAllHealthFacility = "/open"
        static let searchAllHealthFacility = "/open/search"
        
    }
    
    
    
    
    
    
    
    
    
    
    struct Reach {
        //Base URL
        static let baseURLS = Config.Reach.baseURLS
        static let baseURLO = Config.Reach.baseURLO
        static let baseURLN = Config.Reach.baseURLN
        static let baseURLV4 = Config.Reach.baseURLV4
        
        // image upload path
        static let uploadMedialUrl = "\(baseURLS)/users/\(Constants.userId)/habits/\(Constants.userHabitId)/media"
        
        //API path
        static let loginAPI =         "/login"
        static let registerAPI =      "/register"
        static let ssoLoginAPI       = "/ssologin"
        static let pingAPI =          "/ping"
        static let visionAPI =        "/visions"
        static let barrierAPI =       "/barriers"
        static let habitAPI =         "/habits"
        static let customHabitAPI =   "/customhabits"
        static let tasksAPI =         "/tasks"
        static let userHabitProfile = "/userHabitProfile"
        static let manageUserHabit  = "/habits/manage"
        static let habitMedia       = "/media"
        static let searchBuddyAPI   = "/me/corp/buddies"
        static let addBuddyAPI   = "/me/buddies"
        static let myBuddyAPI   = "/me/buddies"
        static let remindBuddyAPI   = "/remind"
        static let revokeBuddyAPI   = "/revoke"
        static let acceptBuddyAPI   = "/accept"
        static let rejectBuddyAPI   = "/reject"
        static let removeBuddyAPI   = "/remove"
        static let stopUserHabitAPI   = "/stop"
        static let addNewHabitAPI   = "/habits/addNewHabit"
        static let getFriendsAPI    = "/getFriends"
        static let acceptAPI    = "/accept"
        static let declineAPI    = "/decline"
        static let appointmentAPI = "/econsult/appointments"
        static let getDaresAPI    = "/getDares"
        static let remindAPI   = "/remind"
        static let revokeAPI   = "/revoke"
        static let getPendingGroupsAPI    = "/group/invitations"
        static let getMyGroupsAPI    = "/groups/my"
        static let getActivityPointsAPI = "/getPoints"
        static let getActivitySummaryAPI = "/getScoreSummary"
        static let getActivityLeaderboardAPI = "/activity/getLeaderBoard"
        static let acceptGroupInvitation = "/acceptinvitation"
        static let declineGroupInvitation = "/declineinvitation"
        static let habitCategoryAPI = "/habits/categories"
        static let programsAPI = "/users/%@/programs"
        static let getBuddyAPI = "/me/buddies"
        static let acceptHabitBuddyAPI = "/me/buddies/%@/accept"
        static let rejectHabitBuddyAPI = "me/buddies/%@/reject"
        static let revokeHabitBuddyAPI = "me/buddies/%@/revoke"
        static let searchHabbitBuddyAPI = "me/corp/buddies"
        
        static let userURL =        "/users/\(Constants.userId)"
        static let corpsURL =       "/corps/\(Constants.corpId)"
        static let visionURL =       "/visions/\(Constants.visionId)"
        static let barrierURL =       "/barries/\(Constants.barrierId)"
        static let categoryURL =       "/habits/categories/\(Constants.categoryId)"
        static let userHabitURL =       "/habits/\(Constants.userHabitId)"
        static let remindBuddyURL =       "/me/buddies/\(Constants.userHabitBuddyId)"
        static let friendRequestURL =       "/friendRequest/\(Constants.friendUserId)"
        static let dareRequestURL =       "/dare/\(Constants.userDareId)"
        static let groupRequestURL =       "/group/\(Constants.userGroupId)"
        static let userHabitIdURL =       "/\(Constants.userHabitId)"
        
        // HOME DASHBOARD CARDS
        static let getHomeCardsURL =  "/users/%@/cards"
        static let deleteAppTourCard = "/users/%@/cards/%@"
        // UPDATE TASKS
         static let updateTasksURL =  "/users/%@/tasks/%@"
        
        // LINK CORPORATE API
        static let addPartnerUrl = "/users/%@/partners/%@"
        static let verifyPartnerUrl = "/users/%@/partners/verify"
        static let deletePartnerUrl = "/users/%@/partners/%@"

        // schedule
        static let scheduleUrl = "/schedule/users/%@/feeds"
        static let taskStreakUrl = "/users/%@/habits/%@/taskSteak"
        
        //social
        static let getSocialFeeds = "/users/%@/getSocialFeeds"
        static let likeDislikeFeed = "/feeds/%@/like"
        static let getMyGroups = "/groups/my"
        static let getOtherGroups = "/groups/others"
        static let getGroupDetail = "/group/%@/details"
        static let createGroup = "/group/add"
        static let searchUsersToAddInSocialGroup = "/group/searchUsers"
        static let createSocialFeed = "/users/%@/postFeed"
        static let addComment = "/feeds/%@/comment"
        static let getFriends = "/users/%@/getFriends"
        static let getDaresList = "/getDares"
        static let getRewards = "/dare/getPrizes"
        static let startDare = "/users/%@/dare/start"
        
        //explore
        static let getPrograms = "/users/%@/programs"
        static let getProgramCategories = "/corps/%@/progCategories"
        static let getProgramCategoryDetails = "/corps/%@/progCategory/%@/programs"
        static let getProgramFeatures = "/corps/%@/programs/%@/durations/0/features"
        static let getProgramBenefits = "/corps/%@/programs/%@/durations/0/benefits"
        static let getProgramTestimonials = "/corps/%@/programs/%@/testimonials"
        static let getProgramDetails = "/corps/%@/programs/%@"
        static let getCoachesForProgram = "/corps/%@/programs/%@/durations/0/availableCoaches"
    }
    

    struct Blossom {
        static let baseURL = Config.Blossom.baseURL
        static let photoBaseURL = Config.Blossom.photoBaseURL
        
        static let parentAPI =        "/parents"
        static let childrenAPI =        "/children"

        //Vaccination
        static let immunizationRecommendationAPI =        "/fhir/ImmunizationRecommendation"
        static let immunizationAPI = "/immunizations"
        
        //Growth chart
        static let observationAPI = "/patient/%@/observations"
    }
    
    struct CrossDashboardExchange {
        static let baseURL = Config.CrossDashboardExchange.baseURL
        
        //CareProvider Practioner Listing
        static let getPractitioner = "/provider/listing/v3/practitioner/%@"
        static let getPractitioners = "/provider/listing/search"
        static let speciality = "/terminology/v2/specialization"
        static let topSpeciality = "/provider/listing/v3/meta/specialization"
        static let practitionerNumber = "/provider/listing/practitioner/%@/phone/masking"
        static let practitionerOrganizationNumber = "/provider/listing/practitioner/%@/organization/%@/phone/masking"
        static let practitionerOrganizationAddress = "/provider/listing/practitioners/%@/locations/%@"
        
        //Carenote
        static let kCareNoteAPI =      "/carenotes"
    }
    
    struct CrossDashboardMedicationExchange {
        static let baseURL = Config.CrossDashboardMedicationExchange.baseURL
        
        //SearchMedicine
        static let kSearchMedicineAPI =      "/terminology/autocomplete/crossrx" //"/terminology/v2/medication"
    }
    
    struct CrossexExchange {
        static let baseURL = Config.CrossexExchange.baseURL
         
        //One View
        static let kOneViewAPI =      "/onehealth/patient/summary"
        
    }
    
    
    
    struct CrossExchange {
        static let baseURL = Config.CrossExchange.baseURL
        static let baseURLV2 = Config.CrossExchange.baseURLV2
        //Carebook        
        static let carebookAPI = "/carebook/%@/folder"
        static let carebookReferenceAPI = "/carebook/%@/reference"
        static let carebookReferenceLinkAPI = "/carebook/%@/link/%@"
        static let documentAPI =        "/document"

        //HealthStats
        static let kObservationAPI =        "/patient/\(Constants.userId)/observations"
        static let kObservationTypeAPI =    "/observation/type"
        static let kObservationOptedTypeAPI =    "/opted-observation-types"
        
        
        //Medication
        static let kAgendaAPI = "/patient/%@/medication-agenda-v2"
        static let kMedicationAPI = "/patient/%@/medication-administration-v2"
        static let kMedicationFromEncounterAPI = "/patient/%@/multiple-medication-administration-v2"
        static let kSearchMedicineAPI = "/terminology/autocomplete/crossrx"
        static let kMedicationAlarms = "/patient/%@/medication-alarm"
        
        
        //Home
        static let kCrossHomeSummaryAPI = "/summary"
        
        //Care Circle Activities
        static let kCareCircleActivitiesAPI = "/carecircle-activities"
    }
    
     struct CrossExchangeNew {
        static let baseURL = Config.CrossExchangeNew.baseURL
        
        // Schedule Detail Medication API
        static let medicationScheduleDetailAPI = "/patient/%@/medication-agenda-v2"

    }
    
    struct Cross {
        static let baseURL = Config.Cross.baseURL
        
        //Carebook
        static let kInvoiceAPI =      "/template/statement/h"
        static let kMedicalCertificateAPI =      "/template/medical-certificate"
        static let kCareNoteHTMLAPI =      "/template/carenote/margin/h"
        static let getCarebookAPI = "/carebook/%@/folder"
        
        //CareCircle
        static let patientSearchAPI =          "/patient/search"
        static let careCircleAPI =             "/carecircle"
        static let patientCheckAPI =           "/cross/patient/check"
        static let careCircleApproveAPI =      "/carecircle/approve"
        static let carecirclePendingAPI =      "/carecircle/pending"
        static let addPatientAPI =             "/add_patient"
        
        
        //CareProvider Practitioner
        static let patientAccessAPI =      "/patientaccess"
        
        //CareProvider Appointment
        static let slotsAPI =              "/slots"
        static let careTeamAPI =      "/careteam_details"
        static let appointmentAPI =        "/appointment"
        static let allAppointmentAPI =        "/patient_appointment"
    }

    struct Mindfulness {
        static let baseURL = Config.Mindfulness.baseURL
        
        //Mindfulness
        static let getUserMindfulnessList = "/module/mindfulness/categories"
        static let markUserDuration = "module/mindfulness/user_lessons"
    }
    
    struct WebPages {
        static let baseURL = Config.WebPages.baseURL
    }
    
    struct Obino{
         static let baseURL = Config.Obino.baseURL
        
        // CALORIE TRACKER API
        static let addUpdateGoal = "/rgobino/reachUser/addUpdateProfile"
        static let getGoal = "/rgobino/reachUser/getProfile"
        static let getCalorieDetails = "/rgobino/reachUser/getCalorieDetails"
        static let getMealHistory = "/rgobino/reachUser/getMealsHistory"
        static let addMealsToDiary = "/rgobino/reachUser/addMealsToDiary"
        static let getExerciseHistory = "/rgobino/reachUser/getExercisesHistory"
        static let addExercisesToDiary = "/rgobino/reachUser/addExercisesToDiary"
        static let searchFoodItems = "/rgobino/reach/foods/search-wdet"
        static let searchExerciseItems = "/rgobino/reach/exercises/search-wdet"
        static let getFrequentFoodItems = "/rgobino/reachUser/frequent-foods-wdet"
        static let getFrequentExercisetems = "/rgobino/reachUser/frequent-exercises-wdet"
        static let getFoodItem =  "/rgobino/reach/foods/get"
        static let getExerciseItem = "/rgobino/reach/exercises/get"
        static let getCustomFoodList = "/rgobino/reachUser/customFood/list"
        static let getCustomExerciseList = "/rgobino/reachUser/getCustomExercises"
        static let postCustomFood = "/rgobino/reachUser/customFood/addUpdate"
        static let postCustomExercise = "/rgobino/reachUser/addUpdateCustomExercises"
        static let getDietAnalysisData = "/rgobino/reachUser/analysis/diet"
        static let getNutrientsAnalysisData = "/rgobino/reachUser/analysis/nutrients"
        static let getScheduledDietPlan = "rgobino/reachUser/my-subs/diet-plan"
    }
    
}

public struct HeaderConstants {
    static let application = Config.application
    static let applicationVersion = Config.applicationVersion
    
    // HeathState
    public static let applicationString = "Reach"

}
