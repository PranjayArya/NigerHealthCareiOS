//
//  AppUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 19/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

struct AppUtils {

    /// Returns app's name
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }

        return nil
    }

    /// Returns app's version number
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /// Return app's build number
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

    /// Return app's bundle ID
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }

    /// Returns both app's version and build numbers "v0.3(7)"
    public static var appVersionAndBuild: String? {
        if appVersion != nil && appBuild != nil {
            if appVersion == appBuild {
                return "v\(appVersion!)"
            } else {
                return "v\(appVersion!)(\(appBuild!))"
            }
        }
        return nil
    }

    /// Return device version ""
    public static var deviceVersion: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }

    /**
     UUID of the Device.
     
     - returns: <#return value description#>
     */
    public static func generateUUID() -> NSString {
        let uuid = UUID().uuidString
        return uuid as NSString
    }

    /// Current Timestamp as Double String.
    public static var CurrentTimestamp: UInt64 {
        return UInt64(Date().timeIntervalSince1970 * 1000)
    }
    
    public static func delay(_ delay: Double, closure:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

    /// Returns the top ViewController
    public static var topMostVC: UIViewController? {
        let topVC = UIApplication.topViewController()
        if topVC == nil {
        }
        return topVC
    }

    #if os(iOS)

    /// Returns current screen orientation
    public static var screenOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

    #endif

    public static var horizontalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.horizontalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    public static var verticalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.verticalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    /// Returns screen width
    public static var screenWidth: CGFloat {

        #if os(iOS)

        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }

        #elseif os(tvOS)

        return UIScreen.main.bounds.size.width

        #endif
    }

    /// Returns screen height
    public static var screenHeight: CGFloat {

        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }
}
