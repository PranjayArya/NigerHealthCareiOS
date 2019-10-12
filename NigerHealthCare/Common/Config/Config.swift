//
//  Config.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

final class Config {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct CommonConfigKeys {
        static let application = "Application"
        static let applicationString = "APPLICATION_STRING"
        static let applicationVersion = "CFBundleShortVersionString"
        static let mixPanelToken = "Mix Panel Token"
        static let mixPanelAPISecret = "Mix Panel API Secret"
        static let environment = "Environment"
    }
    
    private static var bundleInfoDictionary: [String: Any] {
        return Bundle(for: self).infoDictionary ?? [:]
    }
    
    static var application: String {
        guard let application = bundleInfoDictionary[CommonConfigKeys.application] as? String else { return ""}
        return application
    }
    
    static var applicationVersion: String {
        guard let applicationVersion = bundleInfoDictionary[CommonConfigKeys.applicationVersion] as? String else { return ""}
        return applicationVersion
    }
    
    static var applicationString: String {
        guard let applicationString = bundleInfoDictionary[CommonConfigKeys.applicationString] as? String else { return ""}
        return applicationString
    }
    
    //MixPanel
    static var mixPanelToken:String {
        return bundleInfoDictionary[CommonConfigKeys.mixPanelToken] as! String
    }
    static var mixPanelAPISecret:String{
        return bundleInfoDictionary[CommonConfigKeys.mixPanelAPISecret] as! String
    }
    
    static var environment:String{
        return bundleInfoDictionary[CommonConfigKeys.environment] as! String
    }
    
}

extension Config {
    
    class Reach {
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "ReachScheme"
            static let host = "ReachHost"
            static let port = "ReachPort"
            static let path = "ReachPath"
            static let version = "ReachVersion"
            static let platformVersion = "ReachPlatformVersion"
            static let platformCode = "ReachPlatformCode"
            static let platformCodeNew = "ReachPlatformCodeNew"
            static let SecureChannel = "ReachSecureChannel"
            static let OpenChannel = "ReachOpenChannel"
            static let api = "ReachAPI"
            static let secretKey = "ReachSecretKey"
        }
        
        private static var bundleInfoDictionary: [String: Any] {
            return Bundle(for: self).infoDictionary ?? [:]
        }
        
        private static var scheme: String {
            guard let scheme = bundleInfoDictionary[ConfigKeys.scheme] as? String else { return ""}
            return scheme
        }
        
        private static var host: String {
            guard let host = bundleInfoDictionary[ConfigKeys.host] as? String else { return ""}
            return host
        }
        
        private static var path: String {
            guard let path = bundleInfoDictionary[ConfigKeys.path] as? String else { return ""}
            return path
        }
        
        private static var secureChannel: String {
            guard let secureChannel = bundleInfoDictionary[ConfigKeys.SecureChannel] as? String else { return ""}
            return secureChannel
        }
        
        private static var openChannel: String {
            guard let openChannel = bundleInfoDictionary[ConfigKeys.OpenChannel] as? String else { return ""}
            return openChannel
        }
        
        private static var port: Int? {
            guard let portString = bundleInfoDictionary[ConfigKeys.port] as? String, let port = Int(portString) else { return nil }
            return port
        }
        
        private static var api: String {
            guard let api = bundleInfoDictionary[ConfigKeys.api] as? String else { return ""}
            return api
        }
        
        private static var version: String {
            guard let version = bundleInfoDictionary[ConfigKeys.version] as? String else { return ""}
            return version
        }
        
        static var platformVersion: String {
            guard let version = bundleInfoDictionary[ConfigKeys.platformVersion] as? String else { return ""}
            return version
        }
        
        static var secretKey: String {
            guard let key = bundleInfoDictionary[ConfigKeys.secretKey] as? String else { return ""}
            return key
        }
        
        private static var platformCode: String {
            guard let code = bundleInfoDictionary[ConfigKeys.platformCode] as? String else { return ""}
            return code
        }
        
        private static var platformCodeNew: String {
            guard let code = bundleInfoDictionary[ConfigKeys.platformCodeNew] as? String else { return ""}
            return code
        }
        
        //Open channel base url
        static var baseURLO: String {
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.port = port
            urlComponents.host = host
            urlComponents.path = "/\(path)/\(openChannel)/\(platformCode)/\(version)"
            return urlComponents.url?.absoluteString ?? ""
        }
        
        //Secure channel base url
        static var baseURLS: String {
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.port = port
            urlComponents.host = host
            urlComponents.path = "/\(path)/\(secureChannel)/\(platformCode)/\(version)"
            return urlComponents.url?.absoluteString ?? ""
        }
        
        //p3 channel base url
        static var baseURLN: String {
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(path)/\(secureChannel)/\(platformCodeNew)/\(version)"
            return urlComponents.url?.absoluteString ?? ""
        }
        
        //v4 channel base url
        static var baseURLV4: String {
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            return urlComponents.url?.absoluteString ?? ""
        }
    }
}

extension Config {
    
    class Blossom {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "BlossomScheme"
            static let host = "BlossomHost"
            static let version = "BlossomVersion"
            static let applicationType = "BlossomApplicationType"
            static let api = "BlossomAPI"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        private static var api:String {
            return Bundle.main.infoDictionary![ConfigKeys.api] as! String
        }
        
        static var applicationType:String {
            return Bundle.main.infoDictionary![ConfigKeys.applicationType] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(api)/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
        
        static var photoBaseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(api)/\(version)/documents"
            return (urlComponents.url?.absoluteString)!
        }
    }
}

extension Config {
   
    class CrossDashboardExchange {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossDashboardExchangeScheme"
            static let host = "CrossDashboardExchangeHost"
            static let port = "CrossDashboardExchangePort"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var port: Int? {
            guard let portString = bundleInfoDictionary[ConfigKeys.port] as? String, let port = Int(portString) else { return nil }
            return port
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.port = port
            urlComponents.host = host
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class CrossDashboardMedicationExchange {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossDashboardExchangeMedicationScheme"
            static let host = "CrossDashboardExchangeMedicationHost"
            static let port = "CrossDashboardExchangeMedicationPort"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var port: Int? {
            guard let portString = bundleInfoDictionary[ConfigKeys.port] as? String, let port = Int(portString) else { return nil }
            return port
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.port = port
            urlComponents.host = host
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class CrossexExchange {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossexExchangeScheme"
            static let host = "CrossexExchangeHost"
            static let version = "CrossexExchangeVersion"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class CrossExchange {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossExchangeScheme"
            static let host = "CrossExchangeHost"
            static let version = "CrossExchangeVersion"
            static let versionV2 = "CrossExchangeVersionV2"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        private static var versionV2: String {
            return Bundle.main.infoDictionary![ConfigKeys.versionV2] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
        
        static var baseURLV2: String {
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(versionV2)"
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class CrossExchangeNew {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossExchangeNewScheme"
            static let host = "CrossExchangeNewHost"
            static let version = "CrossExchangeNewVersion"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class Cross {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "CrossScheme"
            static let host = "CrossHost"
            static let version = "CrossVersion"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class Mindfulness {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "MindfulnessScheme"
            static let host = "MindfulnessHost"
            static let project = "MindfulnessProject"
            static let version = "MindfulnessVersion"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        private static var project:String {
            return Bundle.main.infoDictionary![ConfigKeys.project] as! String
        }
        
        private static var version:String {
            return Bundle.main.infoDictionary![ConfigKeys.version] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(project)/\(version)"
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class WebPages {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "WebPagesScheme"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = AuthUtils.getServiceDomain()
            return (urlComponents.url?.absoluteString)!
        }
    }
    
    class Obino {
        
        // MARK: Declaration for string constants to be used to decode and also serialize.
        private struct ConfigKeys {
            static let scheme = "ObinoScheme"
            static let host = "ObinoHost"
        }
        
        private static var scheme:String {
            return Bundle.main.infoDictionary![ConfigKeys.scheme] as! String
        }
        
        private static var host:String {
            return Bundle.main.infoDictionary![ConfigKeys.host] as! String
        }
        
        static var baseURL:String{
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            return (urlComponents.url?.absoluteString)!
        }
        
        static var domain:String{
            return host
        }
    }

    
}

