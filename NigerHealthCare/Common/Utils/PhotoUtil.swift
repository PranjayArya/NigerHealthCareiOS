
import UIKit
import MobileCoreServices
import PhotosUI
import Photos


public enum CameraState {
    case ready, accessDenied, noDeviceFound, notDetermined
}

public enum PhotoGalleryState {
    case ready, accessDenied, restricted, notDetermined
}


class PhotoUtil: NSObject {
    
    typealias PhotoUtilCompletion = ((_ photo:Photo)->Void)
    typealias ImagePickerCompletion = ((_ photos:[UIImage])->Void)
    
    
    /// A block creating UI to present error message to the user. This can be customised to be presented on the Window root view controller, or to pass in the viewController which will present the UIAlertController, for example.
    
    var showErrorBlock:( _ errTitle: String, _ errMessage: String) -> Void = { (erTitle: String, erMessage: String) -> Void in
        
        var alertController = UIAlertController(title: erTitle, message: erMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in
            
            
        }))
        
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alertController, animated: true, completion:nil)
        }
    }
    
    
    /**
     Current camera status.
     
     :returns: Current state of the camera: Ready / AccessDenied / NoDeviceFound / NotDetermined
     */
    func currentCameraStatus() -> CameraState {
        return checkIfCameraIsAvailable()
    }
    
    /// Property to determine if the manager should show the camera permission popup immediatly when it's needed or you want to show it manually. Default value is true. Be carful cause using the camera requires permission, if you set this value to false and don't ask manually you won't be able to use the camera.
    var showAccessPermissionPopupAutomatically = true
    
    
    var imagePicker:UIImagePickerController!
    
    
    var completionHandler:PhotoUtilCompletion?
    
    var imagePickerCompletionHandler: ImagePickerCompletion?
    
    //MARK: Initialization
    
    override init() {
        super.init()
        imagePicker = setupPickerController()
    }
    
    func canLoadCamera() -> Bool {
        let currentCameraState = checkIfCameraIsAvailable()
        return currentCameraState == .ready || (currentCameraState == .notDetermined && showAccessPermissionPopupAutomatically)
    }
    
    
    func canLoadPhotoGallery() -> Bool {
        let currentPhotoGalleryState = checkauthorizationOfPhotoGallery()
        return currentPhotoGalleryState == .ready || (currentPhotoGalleryState == .notDetermined && showAccessPermissionPopupAutomatically)
    }
    
    private func checkIfCameraIsAvailable() -> CameraState {
        let deviceHasCamera = UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.rear) || UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.front)
        if deviceHasCamera {
            let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            let userAgreedToUseIt = authorizationStatus == .authorized
            if userAgreedToUseIt {
                return .ready
            } else if authorizationStatus == AVAuthorizationStatus.notDetermined {
                return .notDetermined
            } else {
                show(title: NSLocalizedString("Camera access denied", comment:""), message:NSLocalizedString("You need to go to settings app and grant acces to the camera device to use it.", comment:""))
                return .accessDenied
            }
        } else {
            show(title: NSLocalizedString("Camera unavailable", comment:""), message:NSLocalizedString("The device does not have a camera.", comment:""))
            return .noDeviceFound
        }
    }
    
    
    // Check photo gallery authorization
    
    private func checkauthorizationOfPhotoGallery() -> PhotoGalleryState{
        var photoGalleryState = PhotoGalleryState.notDetermined
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                photoGalleryState = PhotoGalleryState.ready
                break
            case .restricted:
                photoGalleryState = PhotoGalleryState.restricted
                self.show(title: NSLocalizedString("IMPORTANT", comment:""), message:NSLocalizedString("Photo library access required to upload photo.", comment:""))
                break
            case .denied:
                photoGalleryState = PhotoGalleryState.accessDenied
                self.show(title: NSLocalizedString("IMPORTANT", comment:""), message:NSLocalizedString("Photo library access required to upload photo.", comment:""))
                break
            default:
                photoGalleryState = PhotoGalleryState.notDetermined
                break
            }
        }
        
        return photoGalleryState
    }
    
    
    
    func show(title: String, message: String) {
        DispatchQueue.main.async  {
            self.showErrorBlock(title, message)
        }
    }
    
    func showCameraCaptureInViewController(viewController:UIViewController,withCompletionHandler handler:@escaping PhotoUtilCompletion) {
        if canLoadCamera(){
            completionHandler = handler
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            viewController.present(imagePicker, animated: true, completion: { () -> Void in
            })
        }
    }
    
    func showPhotoLibraryPickerInViewController(viewController:UIViewController,withCompletionHandler handler:@escaping PhotoUtilCompletion) {
        if canLoadPhotoGallery() {
            completionHandler = handler
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            viewController.present(imagePicker, animated: true, completion: { () -> Void in
                
            })
        }
    }
    

    
    private func setupPickerController() -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.navigationBar.isTranslucent = false
        imagePicker.mediaTypes = NSArray(objects:kUTTypeImage,kUTTypeVideo,kUTTypeMovie) as! [String]
        imagePicker.delegate = self
        return imagePicker
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            // we got back an error!
        }
    }
    
    func openPhotoOptions(fromController controller:UIViewController, completionCallback callback:@escaping PhotoUtilCompletion){
        
        let optionsMenu = UIAlertController(title: nil, message: "Choose Photo Selection Option", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            [weak self](_: UIAlertAction!) in
            if let _StrongSelf = self{
                _StrongSelf.showCameraCaptureInViewController(viewController: controller, withCompletionHandler: callback)
            }
        })
        
        let photoGalleryAction = UIAlertAction(title: "Photo Gallery", style: .default, handler: {[weak self](_: UIAlertAction!) in
            if let _StrongSelf = self{
                _StrongSelf.showPhotoLibraryPickerInViewController(viewController: controller, withCompletionHandler: callback)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionsMenu.addAction(cameraAction)
        optionsMenu.addAction(photoGalleryAction)
        optionsMenu.addAction(cancelAction)
        
        controller.present(optionsMenu, animated: true, completion: nil)
    }

}

//MARK: - UIImagePickerControllerDelegate
extension PhotoUtil:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        if mediaType.isEqual(to: kUTTypeImage as String) {
            
            //Photo model to store fetched image information ie. name, path, image.
            let photo = Photo()
            
            var fileName = "temp.png"
            let fetchResult = PHAsset.fetchAssets(with: .image, options: nil)
            let asset = fetchResult.lastObject
            let options:PHImageRequestOptions = PHImageRequestOptions()
            options.version = PHImageRequestOptionsVersion.current
            
            if asset != nil {
                fileName = (asset?.value(forKey: "filename") as? String)!
                
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                let fileSize = (asset?.pixelWidth)! * (asset?.pixelHeight)!
                
                if picker.sourceType == .camera{
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
                }
                photo.image = image
                photo.name = fileName
                photo.filePath = "\(fileName)"
                photo.fileSize = Int(fileSize)
                self.completionHandler!(photo)
                
            }else{
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                photo.image = image
                photo.name = fileName
                photo.filePath = "\(fileName)"
                self.completionHandler!(photo)

            }
            
        } else if mediaType.isEqual(to: kUTTypeMovie as String) {
            
            // Media is a video
            
        }
        
        picker.presentingViewController?.dismiss(animated: true, completion: { () -> Void in
            UIApplication.shared.statusBarStyle = .lightContent
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.presentingViewController?.dismiss(animated: true, completion: { 
            UIApplication.shared.statusBarStyle = .lightContent
        })
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
}


