//
//  NigerHealthCareService.swift
//  NigerHealthCare
//
//  Created by Pranjay on 17/03/19.
//  Copyright © 2019 Pranjay Arya. All rights reserved.
//

import Foundation
import Alamofire

class NigerHealthCareService{
    
    class func userLogin(body:RequestBody, successCallback: @escaping ((_ response: JSON?) -> Void),
                                 errorCallback: @escaping ((_ error: NSError) -> Void),
                                 networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseFormRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.login(body)), completionHandler: { (response) in
            
            print(response)
              
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func userSignUp(body:RequestBody, successCallback: @escaping ((_ response: JSON?) -> Void),
                         errorCallback: @escaping ((_ error: NSError) -> Void),
                         networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.signUp(body)), completionHandler: { (response) in

            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func socialLogin(params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                          errorCallback: @escaping ((_ error: NSError) -> Void),
                          networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.socialLogin(params)), completionHandler: { (response) in

            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func userContext(headers:RequestHeaders, successCallback: @escaping ((_ response: JSON?) -> Void),
                          errorCallback: @escaping ((_ error: NSError) -> Void),
                          networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getContext(headers)), completionHandler: { (response) in

            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func getMedicines(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                           errorCallback: @escaping ((_ error: NSError) -> Void),
                           networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getMedicine(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func searchMedicines(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                            errorCallback: @escaping ((_ error: NSError) -> Void),
                            networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.searchMedicine(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func getNearbyStores(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                               errorCallback: @escaping ((_ error: NSError) -> Void),
                               networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getNearByStores(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func getHealthFacilities(headers:RequestHeaders, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                               errorCallback: @escaping ((_ error: NSError) -> Void),
                               networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getHealthFacilities(headers)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON,let content = responseJSON["content"] as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(content)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    
    class func getBookmarkedMedicine(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                               errorCallback: @escaping ((_ error: NSError) -> Void),
                               networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getBookmarkedMedicine(headers, params)), completionHandler: { (response) in

            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func bookmarkMedicine(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                               errorCallback: @escaping ((_ error: NSError) -> Void),
                               networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.bookmarkMedicine(headers, params)), completionHandler: { (response) in
            
            
            print(response)
            
            
            guard let responseJSON = response as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func unbookmarkMedicine(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                               errorCallback: @escaping ((_ error: NSError) -> Void),
                               networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.unbookmarkMedicine(headers, params)), completionHandler: { (response) in
            
            
            print(response)
            
            
            guard let responseJSON = response as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func changePassword(userId:String,headers:RequestHeaders,body:RequestBody, successCallback: @escaping ((_ response: JSON?) -> Void),
                          errorCallback: @escaping ((_ error: NSError) -> Void),
                          networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.changePassword(userId,headers,body)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func forgotPassword(body:RequestBody, successCallback: @escaping ((_ response: JSON?) -> Void),
                         errorCallback: @escaping ((_ error: NSError) -> Void),
                         networkCallback: @escaping (() -> Void)) {
        
        NetworkAdapter.request(NigerHealthCareBaseFormRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.forgotPassword(body)), completionHandler: { (response) in
            
            print(response)
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    
    class func getMedicinesHealthFacility(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                            errorCallback: @escaping ((_ error: NSError) -> Void),
                            networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.getAllMedicinesInFacility(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func addMedicinesHealthFacility(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                                          errorCallback: @escaping ((_ error: NSError) -> Void),
                                          networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.addMedicinesInFacility(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func removeMedicinesHealthFacility(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void),
                                          errorCallback: @escaping ((_ error: NSError) -> Void),
                                          networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.removeMedicinesInFacility(headers, params)), completionHandler: { (response) in
            
            guard let responseJSON = response as? JSON else {
                successCallback(nil)
                return
            }
            successCallback(responseJSON)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func searchHealthFacility(headers:RequestHeaders,params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                                             errorCallback: @escaping ((_ error: NSError) -> Void),
                                             networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.searchHealthFacility(headers, params)), completionHandler: { (response) in
            guard let responseJSON = response as? JSON,let content = responseJSON["content"] as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(content)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    
    class func openHealthFacility(params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                                    errorCallback: @escaping ((_ error: NSError) -> Void),
                                    networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.openHealthFacility(params)), completionHandler: { (response) in
            guard let responseJSON = response as? JSON,let content = responseJSON["content"] as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(content)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
    class func openSearchHealthFacility(params:QueryParams, successCallback: @escaping ((_ response: [JSON]?) -> Void),
                                    errorCallback: @escaping ((_ error: NSError) -> Void),
                                    networkCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(NigerHealthCareBaseRouter.nigerHealthCareRouterManager(NigerHealthCareRouter.openHealthFacilitySearch(params)), completionHandler: { (response) in
            guard let responseJSON = response as? JSON,let content = responseJSON["content"] as? [JSON] else {
                successCallback(nil)
                return
            }
            successCallback(content)
            
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkCallback()
        }
    }
    
}
