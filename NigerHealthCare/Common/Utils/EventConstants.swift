//
//  EventConstants.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 09/10/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit



var mutableHomeDashboardEventDict = ["actionTakenFrom":"","cardType":"","area":"","actionId":"","cardId":""]
var mutableDashboardEventDict = ["actionTakenFrom":"","cardType":"","area":"","actionId":""]

struct Events{
    
     /////////////////
    
    struct area{
        static let dare = "Dare"
        static let friends = "Friends"
        static let group = "Group"
        static let feed = "Feed"
        static let wellbeingSchedule = "Wellbeing Schedule"
        static let mindfulness = "Mindfulness"
        static let coaching = "Coaching"
        static let careCircle = "Care Circle"
        static let appointment = "Appointment"
        static let healthTracker = "Health Tracker"
        static let medication = "Medication"
        static let appTour = "App Tour"
        static let feedback = "Feedback"
        static let groups = "Groups"
        static let leaderboard = "Leaderboard"
        static let careBook = "CareBook"
        static let vaccination = "Vaccination"
        static let growthCharts = "Growth Charts"
        static let vbh = "VBH set up"
        static let healthMenu = "Health Menu"
        static let wellbeingMenu = "Wellbeing Menu"
    }
    
    struct action {
        static let healthHome = "Health_Home"
        static let wellbeingHome = "Wellbeing_Home"
        static let homeWellbeing = "Home - Wellbeing"
        static let homeHealth = "Home - Health"
        static let homeAppTour = "Home - App Tour"
        static let homeFeedback = "Home - Feedback"

    }
    
    struct card {
        static let empty = "Empty State"
        static let filled = "Filled State"
    }
    
    struct cardType {
        static let discovery = "Discovery"
         static let action = "Action"
        
    }
    
    
    struct actionID {
        static let searchDoctor = "Search Doctor"
        static let viewAppointment = "View Appointment"
        static let addMedication = "Add Medication"
        static let viewMedications = "View Medications"
        static let addTracker = "Add Tracker"
        static let addMember = "Add Member"
        static let viewCareCircle = "View Care Circle"
        static let addRecord = "Add Record"
        static let viewRecords = "View records"
        static let vBHSetUp = "VBH Set Up"
        static let specificTaskClicked = "Specific Task Clicked"
        static let viewTaskList = "View Task List"
        static let addFriend = "Add Friend"
        static let acceptRequest = "Accept Request"
        static let rejectRequest = "Reject Request"
        static let viewFriends = "View Friends"
        static let addDare = "Add Dare"
        static let acceptDare = "Accept Dare"
        static let viewLeaderboard = "View Leaderboard"
        static let exploreGroups = "Explore Groups"
        static let viewGroups = "View Groups"
        static let playCourse = "Play Course"
        static let bookConsult = "Book consult"
        static let viewPlan = "View Plan"
        static let viewFeed = "View Feed"
        static let taskTracked = "Task Tracked"
        static let addHabitBuddy = "Add Habit Buddy"
        static let enrol = "Enrol"
        static let addChild = "Add Child"
        static let giveAccess = "Give Access"
        static let discardAccess = "Discard Access"
        static let viewPrescription = "View Prescription"
        static let scheduleFollowUp = "Schedule Follow Up"
        static let addPrescription = "Add Prescription"
        static let viewContent = "View Content"
        static let addDiet = "Add Diet"
        static let addFitness = "Add Fitness"
        static let addMedications = "Add Medications"
        static let view = "View"
        static let giveFeedback = "Give Feedback"
    }
    

    struct onboardingScreen{
         static let signUporLoginClick = "SignUporLoginClick"
         static let userCreated = "UserCreated"
    }
    
    
    struct homeCard{
        static let clicked = "Home_CardClicked"
    }
    
    
    struct healthHome {
        static let clicked = "HealthHome_CardClicked"
    }
    
    
    struct wellbeingHome {
        static let clicked = "WellbeingHome_CardClicked"
    }
    
    struct notification{
        static let clicked = "Notification_clicked"
    }
    
    struct profile{
        static let clicked = "Profile_clicked"
       // static let Mobile phone,email,name updated
    }
    
    struct careBook{
        static let addNewNote = "AddNewNote"
        static let addedEventDetails = "AddedEventDetails"
        static let uploadImage = "UploadImage"
        static let eventTabClick = "EventTabClick"
        static let oneViewTabClick = "OneViewTabClick"
    }
    
    struct appointment{
        static let careTeamDoctorSelected = "CareTeamDoctorSelected"
        static let doctorSearch = "DoctorSearch"
        static let doctorSelectedfromSearch = "DoctorSelectedfromSearch"
        static let clinicSelected = "ClinicSelected"
        static let slotSelected = "AppointmentSlotSelected"
        static let confirmed = "AppointmentConfirmed"
        static let reschedule = "AppointmentReschedule"
        static let cancel = "AppointmentCancel"
    }
    
    struct careCircle {
        static let addAdultMember = "AddAdultMember"
        static let addChildMember = "AddChildMember"
        static let childAddedSuccessfully = "ChildAddedSuccessfully"
        static let memberInvitedSuccessfully = "MemberInvitedSuccessfully"
        static let acceptInvite = "AcceptInvite"
        static let rejectInvite = "RejectInvite"
        static let pendingActions = "PendingActions"
    }
    
    struct medication {
        static let add = "AddMedication"
        static let save = "SaveMedication"
        static let edit = "EditMedication"
        static let suspend = "SuspendMedication"
        static let start = "StartMedication"
        static let scheduleTabClicked = "ScheduleTabClicked"
        static let allMedicationTabClicked = "AllMedicationTabClicked"
    }
    
    struct healthTracker{
        static let add = "AddTracker"
        static let dashboardTabClicked = "DashboardTabClicked"
        static let todayTabSelected = "TodayTabSelected"
        static let specifcTrackerSelected = "SpecifcTrackerSelected"
        static let valueAdded = "ValueAdded"
    }
    
    struct vaccination{
        static let add = "AddVaccination"
        static let view = "ViewVaccination"
        static let groupDetails = "VaccinationGroupDetails"
        static let details = "VaccinationDetails"
    }
    
    struct growthChart{
        static let addGrowthData = "AddGrowthData"
        static let updateData = "UpdateData"
        static let viewGrowthData = "ViewGrowthData"
    }
    
    struct vBHSetUp{
        static let start = "StartVBHSetup"
        static let selectedVision = "SelectedVision"
        static let selectedBarrier = "SelectedBarrier"
        static let selectedHabit = "SelectedHabit"
        static let customHabitAdded = "CustomHabitAdded"
    }
    
    struct healthMenu{
        static let appointment = "Menu_Appointment"
        static let medication = "Menu_Medication"
        static let healthTracker = "Menu_HealthTracker"
        static let carecircle = "Menu_Carecircle"
        static let careBook = "Menu_CareBook"
        static let careTeam = "Menu_CareTeam"
    }
    
    struct wellBeingMenu{
        static let habits = "Menu_Habits"
        static let coaching = "Menu_Coaching"
        static let programmes = "Menu_Programmes"
        static let feed = "Menu_Feed"
        static let friends = "Menu_Friends"
        static let leaderboard = "Menu_Leaderboard"
        static let groups = "Menu_Groups"
        static let dare = "Menu_Dare"
    }
    
    /////////////////
//    
//    struct App{
//        static let App_Launched = "App Launched"
//        
//        struct MainPage{
//            static let MainPage_Feed = "MainPage_Feed"
//            static let MainPage_HolisticHealth = "MainPage_HolisticHealth"
//            static let MainPage_Stats = "MainPage_HealthStats"
//            static let MainPage_Caregiver = "MainPage_Caregiver"
//            static let MainPage_Records = "MainPage_Records"
//        }
//    }
//    
//    struct Welcome {
//        static let Screen = "Welcome_Screen"
//    }
//    
//    struct Splash {
//        static let Screen = "Splash_Screen"
//        static let SignUp = "Splash_SignUp"
//        static let Login = "Splash_Login"
//        static let OnBoarding = "Splash_OnBoarding"
//    }
//    
//    struct SignUp {
//        
//        struct Parent {
//            static let ParentProfileCompletion = "Profile Completion - Parent"
//        }
//        
//        struct Child {
//            static let ChildProfileCompletion = "Profile Completion - Parent & Child"
//        }
//        
//        struct Register {
//            static let RegisterSignUpCompletion = "Register_SignUp"
//        }
//    }
//    
//     struct OnBoarding {
//        static let SignUp = "OnBoarding_Register"
//        static let Login = "OnBoarding_SignIn"
//    }
//    
//    struct Login {
//        static let ForgotPassword = "Login_ForgotPassword"
//        static let SignUp = "Login_SignUp"
//        static let Signed_In_Success = "Login_Successful"
//    }
//    
//    struct VerifyAccount {
//        static let Screen = "EnterMobile_OpenVerifyPage"
//        static let OTPVerified_Success = "EnterMobile_OTPVerified"
//    }
//    
//    struct Hamburger {
//        static let ParentProfile = "HamburgerMenu_ParentProfile"
//        static let KidProfile = "HamburgerMenu_KidProfile"
//        static let InviteFriends = "HamburgerMenu_InviteFriends"
//        static let RateApp = "HamburgerMenu_RateApp"
//        static let SendFeedback = "HamburgerMenu_SendFeedback"
//        static let AboutUs = "HamburgerMenu_AboutUs"
//        static let Terms_And_Condition = "HamburgerMenu_Terms_&_Condition"
//        static let Privacy_Policy = "HamburgerMenu_Privacy_Policy"
//        static let Logout = "HamburgerMenu_Logout"
//    }
//    
//    struct Profile {
//        
//        struct ProfileToggle {
//            static let SelectedChildProfile = "Profile_Childs"
//            static let SelectedParentProfile = "Profile_Parents"
//        }
//
//        struct ParentProfile{
//            static let AddNew = "ParentProfile_AddNew"
//            static let Edit = "ParentProfile_Edit"
//            static let CustomiseExperience = "ParentProfile_CustomiseExperienceClick"
//            static let HelpUsBetter = "ParentProfile_MoreDetailsClick"
//            static let Done = "ParentProfile_Done"
//            
//            struct InterestArea{
//                static let Updated = "ParentProfile_InterestAreaUpdated"
//                static let Skip = "ParentProfile_InterestAreaSkip"
//            }
//            
//            struct MoreDetails{
//                static let Updated = "ParentProfile_MoreDetailsUpdated"
//                static let Skip = "ParentProfile_MoreDetailsSkip"
//            }
//        }
//        
//        struct ChooseChildProfile{
//            static let Screen = "SelectChild_Profile"
//        }
//        
//        struct ChildProfile{
//            static let Created = "ChildProfile_Created"
//            static let AddNew = "ChildProfile_AddNew"
//            static let Edit = "ChildProfile_Edit"
//            static let CustomiseExperience = "ChildProfile_CustomiseExperience"
//            static let AddDocuments = "ChildProfile_AddDocuments"
//            static let Done = "ChildProfile_Done"
//        }
//        
//        struct ChildProfileSchool {
//            static let Skip = "ChildProfile_SchoolSkip"
//            static let Updated = "ChildProfile_SchoolUpdated"
//        }
//        
//        struct ChildProfileActivity {
//            static let Skip = "ChildProfile_ActivitiesSkip"
//            static let Updated = "ChildProfile_ActivitiesUpdated"
//        }
//        
//        struct ChildProfileFood {
//            static let Skip = "ChildProfile_FoodSkip"
//            static let Updated = "ChildProfile_FoodUpdated"
//        }
//        
//        struct ChildProfilePlaces {
//            static let Skip = "ChildProfile_PlacesSkip"
//            static let Updated = "ChildProfile_PlacesUpdated"
//        }
//        
//        struct ChildProfileDocument {
//            static let Add = "ChildProfile_AddOtherDocuments"
//            static let Skip = "ChildProfile_AddDocumentsSkip"
//            static let Updated = "ChildProfile_AddDocumentsDone"
//        }
//    }
//
//    struct Caregiver {
//        static let ChildSelected = "Caregiver_SelectedChild"
//        
//        struct Doctor{
//            static let Screen = "DoctorsAndCommunities_Doctors"
//            static let Add = "Doctor_FindFirstTime"
//            static let Search = "Doctor_Search"
//            static let CancelAppointment = "Appointment_Cancel"
//
//            struct DoctorDetails{
//                static let About = "DoctorDetails_About"
//                static let Feedback = "DoctorDetails_Feedback"
//                static let Connect = "DoctorDetails_Connect"
//            }
//            
//            struct Appointment{
//                static let Book = "Appointment_Book"
//                static let SelectSlot = "Appointment_SelectedSlot"
//                static let ReasonforVisit = "Appointment_SelectedReasonforVisit"
//                static let SelectedChild = "Appointment_SelectedChild"
//                static let Confirm = "Appointment_Confirm"
//                static let Updated = "Appointment Updated"
//                static let Cancel = "Appointment_Cancel"
//            }
//            
//            struct DoctorSearch{
//                static let Book = "DoctorSearch_Book"
//                static let Detail = "DoctorSearch_Details"
//
//            }
//        }
//        
//        struct Community{
//            static let Screen = "DoctorsAndCommunities_Communities"
//            static let Add = "Communities_FirstTime"
//        }
//    }
//    
//    struct Records {
//        static let ChildSelected = "Records_SelectedChild"
//        static let Add = "Records_AddFirstTime"
//        static let SelectRecordType = "Records_SelectedRecordType"
//        static let CompleteUpload = "Records_CompleteUpload"
//        static let RecordsTypeFilter = "Records_RecordTypeFilterClick"
//        static let DoctorTypeFilter = "Records_DoctorFilterClick"
//        static let CreatedMedicalCertificate = "RecordsMedicalCertificate_Created"
//        static let CreatedLabReport = "RecordsLabReport_Created"
//        static let CreatedBill = "RecordsBill_Created"
//        static let CreatedPrescription = "RecordsPrescription_Created"
//        static let MoreActions = "Records_MoreActions"
//        static let UploadRecords = "Records_UploadRecords"
//    }
//    
//    struct HolisticHealth {
//        static let ChildSelected = "HolisticHealth_SelectedChild"
//        static let Add = "HolisticHealth_AddFirstTime"
//        static let Edit = "HolisticHealthDashboard_Edit"
//        static let HolisticHealthMeans = "HolisticHealth_Means_Screen"
//
//         struct HolisticHealthParameters {
//            static let PhysicalDev = "HolisticHealthParameters_PhysicalDev"
//            static let SocialDev = "HolisticHealthParameters_SocialDev"
//            static let LangDev = "HolisticHealthParameters_LangDev"
//            static let CognitiveDev = "HolisticHealthParameters_CognitiveDev"
//            static let Completed = "HolisticHealthParameters_Complete"
//        }
//        
//        struct HolisticHealthQuestion {
//            static let Completed = "HolisticHealthDomainQuestionnaire_Complete"
//            static let Skip = "HolisticHealthDomainQuestionnaire_Skip"
//        }
//        
//    }
//    
//    struct HealthStats {
//        static let ChildSelected = "HealthStats_SelectedChild"
//        
//        struct HealthStatsToggle {
//            static let SelectedVaccination = "Stats_Vaccination"
//            static let SelectedGrowthChart = "Stats_GrowthChart"
//        }
//        
//        struct Vaccination{
//            static let Add = "Vaccination_AddFirstTime"
//            static let Edit = "Vaccination_Edit"
//            static let Detail = "VaccinationDetail"
//            static let Updated = "VaccinationDetails_Updated"
//            static let Information = "VaccinationDetails_Information"
//            static let Skip = "VaccinationDetails_Skip"
//            
//            struct Dashboard{
//                static let ViewAllVaccinations = "VaccinationDashboard_ViewAllVaccinations"
//            }
//        }
//        
//        struct GrowthChart{
//            static let Add = "GrowthChart_AddFirstTime"
//            static let SaveDetails = "GrowthChartStats_SaveDetails"
//            static let ShowResults = "GrowthChartReviewData_ShowResults"
//            static let CurrentParameters = "GrowthChartCurrent_Parameters_Screen"
//            static let BirthParameters = "GrowthChartBirthParameters"
//            static let BirthParametersSkip = "GrowthChartBirthParameters_Skip"
//            static let CurrentParametersSkip = "GrowthChartCurrentParameters_Skip"
//            static let BirthParametersDone = "GrowthChartBirthParameters_Done"
//            static let CurrentParametersDone = "GrowthChartCurrentParameters_Done"
//            static let GrowthChartInformation = "GrowthChart_Information"
//            static let GrowthChartStatsViewData = "GrowthChartStats_ViewData"
//
//            struct Height{
//                static let PercentileGraph = "GrowthChartDashboard_PercentileGraphHeight"
//                static let Update = "GrowthChartDashboard_UpdateDetailsHeight"
//            }
//            struct Weight{
//                static let PercentileGraph = "GrowthChartDashboard_PercentileGraphWeight"
//                static let Update = "GrowthChartDashboard_UpdateDetailsWeight"
//            }
//            struct BMI{
//                static let Update = "GrowthChartDashboard_UpdateDetailsBMI"
//            }
//            struct Head{
//                static let PercentileGraph = "GrowthChartDashboard_PercentileGraphHead"
//                static let Update = "GrowthChartDashboard_UpdateDetailsHead"
//            }
//        }
//    }
//    
//    struct Feeds {
//        static let ChildSelected = "Feeds_SelectedChild"
//        static let FeedsArticleDetails = "ArticleDetails_Feeds"
//        static let ArticleDetailsBookmark = "ArticleDetails_Bookmark"
//    }
}
