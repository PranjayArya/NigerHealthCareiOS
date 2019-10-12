//
//  NigerHealthCareRouter.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import Alamofire

enum NigerHealthCareRouter: BaseRouterProtocol {
    
    case signUp(RequestBody)
    case login(RequestBody)
    case socialLogin(QueryParams)
    case getContext(RequestHeaders)
    case getMedicine(RequestHeaders,QueryParams)
    case searchMedicine(RequestHeaders,QueryParams)
    case getNearByStores(RequestHeaders,QueryParams)
    case getHealthFacilities(RequestHeaders)
    case getBookmarkedMedicine(RequestHeaders,QueryParams)
    case bookmarkMedicine(RequestHeaders,QueryParams)
    case unbookmarkMedicine(RequestHeaders,QueryParams)
    case changePassword(String,RequestHeaders,RequestBody)
    case forgotPassword(RequestBody)
    case getAllMedicinesInFacility(RequestHeaders,QueryParams)
    case addMedicinesInFacility(RequestHeaders,QueryParams)
    case removeMedicinesInFacility(RequestHeaders,QueryParams)
    case searchHealthFacility(RequestHeaders,QueryParams)
    case openHealthFacility(QueryParams)
    case openHealthFacilitySearch(QueryParams)
    var path: String{
        switch self{
        case .signUp:
            return APIConstants.NigerHealthCare.signUpAPI
        case .login:
            return APIConstants.NigerHealthCare.loginAPI
        case .socialLogin:
            return APIConstants.NigerHealthCare.socialLoginSignUp
        case .getContext:
            return APIConstants.NigerHealthCare.getContext
        case .getMedicine:
            return APIConstants.NigerHealthCare.getMedicine
        case .searchMedicine:
            return APIConstants.NigerHealthCare.searchMedicine
        case .getNearByStores:
            return APIConstants.NigerHealthCare.getNearbyStores
        case .getHealthFacilities:
            return APIConstants.NigerHealthCare.getHealthFacilities
        case .getBookmarkedMedicine:
            return APIConstants.NigerHealthCare.getBookmarkedMedicines
        case .bookmarkMedicine:
            return APIConstants.NigerHealthCare.bookmarkMedicine
        case .unbookmarkMedicine:
            return APIConstants.NigerHealthCare.removeBookmarkedMedicine
        case .changePassword(let userID, _, _):
            return String.localizedStringWithFormat(APIConstants.NigerHealthCare.changePassword,userID)
        case .forgotPassword:
            return APIConstants.NigerHealthCare.forgotPassword
        case .getAllMedicinesInFacility:
            return APIConstants.NigerHealthCare.getMedicineFromFacility
        case .addMedicinesInFacility:
            return APIConstants.NigerHealthCare.addMedicineForFacility
        case .removeMedicinesInFacility:
            return APIConstants.NigerHealthCare.removeMedicineForFacility
        case .searchHealthFacility:
            return APIConstants.NigerHealthCare.searchHealthFacility
        case .openHealthFacility:
            return APIConstants.NigerHealthCare.getAllHealthFacility
        case .openHealthFacilitySearch:
            return APIConstants.NigerHealthCare.searchAllHealthFacility
        }
    }
    
    var method: Alamofire.HTTPMethod{
        switch self {
        case .signUp:
            return .post
        case .login:
            return .post
        case .socialLogin:
            return .get
        case .getContext:
            return .get
        case .getMedicine:
            return .get
        case .searchMedicine:
             return .get
        case .getNearByStores:
            return .get
        case .getHealthFacilities:
            return .get
        case .getBookmarkedMedicine:
            return .get
        case .bookmarkMedicine:
            return .get
        case .unbookmarkMedicine:
            return .get
        case .changePassword:
            return .post
        case .forgotPassword:
            return .post
        case .getAllMedicinesInFacility:
            return .get
        case .addMedicinesInFacility:
            return .get
        case .removeMedicinesInFacility:
            return .get
         case .searchHealthFacility:
            return .get
        case .openHealthFacility:
            return .get
        case .openHealthFacilitySearch:
            return .get
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .signUp:
            return nil
        case .login(let parameters):
            return parameters
        case .socialLogin(let parameters):
            return parameters
        case .getContext:
            return nil
        case .getMedicine(_,let parameters):
            return parameters
        case .searchMedicine(_,let parameters):
            return parameters
        case .getNearByStores(_,let parameters):
             return parameters
        case .getHealthFacilities:
            return nil
        case .getBookmarkedMedicine(_,let parameters):
            return parameters
        case .bookmarkMedicine(_,let parameters):
            return parameters
        case .unbookmarkMedicine(_,let parameters):
            return parameters
        case .changePassword:
            return nil
        case .forgotPassword:
            return nil
        case .getAllMedicinesInFacility(_,let parameters):
            return parameters
        case .addMedicinesInFacility(_,let parameters):
            return parameters
        case .removeMedicinesInFacility(_,let parameters):
            return parameters
         case .searchHealthFacility(_,let parameters):
             return parameters
        case .openHealthFacility(let parameters):
            return parameters
        case .openHealthFacilitySearch(let parameters):
            return parameters
        }
    }
    
    var body: AnyObject?{
        
        switch self{
        case .signUp(let params):
            return params as AnyObject
        case .login:
            return nil
        case .socialLogin:
            return nil
        case .getContext:
            return nil
        case .getMedicine:
            return nil
        case .searchMedicine:
            return nil
        case .getNearByStores:
            return nil
        case .getHealthFacilities:
            return nil
        case .getBookmarkedMedicine:
            return nil
        case .bookmarkMedicine:
            return nil
        case .unbookmarkMedicine:
            return nil
        case .changePassword(_, _, let params):
            return params as AnyObject
        case .forgotPassword(let params):
            return params as AnyObject
        default:
            return nil
        }
        
    }
    
    var headers: [String : String]?{
        switch self {
        case .getContext(let headers):
            return headers
        case .getMedicine(let headers,_):
            return headers
        case .searchMedicine(let headers,_):
            return headers
        case .getNearByStores(let headers,_):
            return headers
        case .getHealthFacilities(let headers):
            return headers
        case .getBookmarkedMedicine(let headers,_):
            return headers
        case .bookmarkMedicine(let headers,_):
            return headers
        case .unbookmarkMedicine(let headers,_):
            return headers
        case .changePassword(_, let headers,_ ):
            return headers
        case .getAllMedicinesInFacility(let headers,_):
            return headers
        case .addMedicinesInFacility(let headers,_):
            return headers
        case .removeMedicinesInFacility(let headers,_):
            return headers
        case .searchHealthFacility(let headers,_):
            return headers
        default:
            return nil
        }
    }
    
}
