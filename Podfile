# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def network_pods
    pod 'Alamofire'
    pod 'AlamofireImage'
    pod 'AlamofireNetworkActivityIndicator'
    pod 'AlamofireObjectMapper'
    pod 'ReachabilitySwift'
    pod 'FBSDKCoreKit', '~> 4.38.0'
    pod 'FBSDKLoginKit', '~> 4.38.0'
    pod 'GoogleSignIn'
    pod 'GoogleMaps'
    pod 'GooglePlaces'
end

def database_pods
    pod 'SwiftyJSON'
end

def util_pods    
    #keyboard
    pod 'IQKeyboardManagerSwift'
    pod 'GooglePlaces'

end


def ui_pods
    pod 'SVProgressHUD'
    pod 'IQDropDownTextField'
end



target 'NigerHealthCare' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
   # Database
    database_pods
    
    # Network
    network_pods
    
    # utility
    util_pods
    
    # UI
    ui_pods
    

  # Pods for NigerHealthCare

end
