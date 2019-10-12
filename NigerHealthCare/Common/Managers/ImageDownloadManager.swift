//
//  ImageDownloadManager.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 18/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class ImageDownloadManager {
    
    
    typealias CompletionHandler = ((_ image: UIImage) -> Void)
    typealias ErrorHandler = ((_ error: Error) -> Void)
    
    static let imageDownloadManager = ImageDownloadManager()
    
    
    
    
    let downloadManager = ImageDownloader()
    let imageCache = AutoPurgingImageCache()
    var completionHandler:CompletionHandler?
    
    private init() {
        // So that we don't initialize the damn thing.
    }
    
    /// Abstracts the logic for asyncronously seting an image to an image view.
    ///
    /// - Parameters:
    ///   - URLPath: A partial image URL path that will be appended to the Base URL.
    ///   - placeholderImage: A placeholder image to set while the image is being downloaded.
    ///   - imageView: A UIImageView that will be set with the image.
    ///   - tag: A unique number in the context of similar type of requests. If your image view is in a UItableCell or
    ///     UICollectionViewCell you can run into issues where wrong images get set to wrong image views because of the
    ///     fact that cells might get reused. You can avoid such issues by setting this parameter to a unique identifier
    ///     per cell for example intexPath.row can be used if you have just one section in the table view.
    ///   - fillColor: A placeholder fill color to set while the image is being downloaded.
    public func setAsyncImage(fromPartialURLPath URLPath: String?,
                              filter:AspectScaledToFillSizeCircleFilter? = nil,
                              placeholderImage: UIImage?,
                              to imageView: UIImageView?,
                              useTag tag: Int?,
                              placeholderFillColor fillColor: UIColor?,
                              showActivityIndicator:Bool? = true, isImageCache:Bool? = true,
                              completion completionHandler:CompletionHandler? = nil,
                              error errorHandler:ErrorHandler? = nil) {
        
        self.completionHandler = completionHandler
        
        if placeholderImage != nil {
            imageView?.image = placeholderImage
        } else {
            imageView?.image = nil
        }
        
        if fillColor != nil {
            imageView?.backgroundColor = fillColor
        } else {
            imageView?.backgroundColor = .clear
        }
        
        guard URLPath != nil else {
            return
        }
        
        if tag != nil {
            imageView?.tag = tag!
        }
        
        let tagToUseForCheck = imageView?.tag
        
        let url = URL(string: URLPath!)
        if url == nil {
            return
        }
        
        // Need to pass access token alng with the request.
        var urlRequest = URLRequest.init(url: url!)
        if let ignoreCache = isImageCache , !ignoreCache {
            urlRequest.cachePolicy = .reloadIgnoringCacheData
        }
       
        
        
        if let cachedImage = imageCache.image(withIdentifier: URLPath!) {
            if imageView?.tag == tagToUseForCheck {
                imageView?.image = cachedImage
                if self.completionHandler != nil{
                    self.completionHandler!(cachedImage)
                }
            }
            return
        }
        
        if showActivityIndicator == true{
            imageView?.showActivityIndicator()
        }
        
        
        
        downloadManager.download(urlRequest, filter: filter) { response in
            if let image = response.result.value {
                self.imageCache.add(image, withIdentifier: URLPath!)
                
                if imageView?.tag == tagToUseForCheck {
                    DispatchQueue.main.async {
                        imageView?.image = image
                    }
                    
                    if self.completionHandler != nil{
                        self.completionHandler!(image)
                    }
                }
            }else {
                if let error = response.error {
                    if errorHandler != nil{
                        errorHandler!(error)
                    }
                }
            }
            
            DispatchQueue.main.async {
                imageView?.hideActivityIndicator()
            }
        }
    }
    
    public func setAsyncImageWithHeader(fromPartialURLPath URLPath: String?,
                              filter:AspectScaledToFillSizeCircleFilter? = nil,
                              placeholderImage: UIImage?,
                              to imageView: UIImageView?,
                              useTag tag: Int?,
                              placeholderFillColor fillColor: UIColor?,
                              showActivityIndicator:Bool? = true,
                              completion completionHandler:CompletionHandler? = nil,
                              error errorHandler:ErrorHandler? = nil) {
        
        self.completionHandler = completionHandler
        
        if placeholderImage != nil {
            imageView?.image = placeholderImage
        } else {
            imageView?.image = nil
        }
        
        if fillColor != nil {
            imageView?.backgroundColor = fillColor
        } else {
            imageView?.backgroundColor = .clear
        }
        
        guard URLPath != nil else {
            return
        }
        
        if tag != nil {
            imageView?.tag = tag!
        }
        
        let tagToUseForCheck = imageView?.tag
        
        let url = URL(string: URLPath!)
        if url == nil {
            return
        }
        
        // Need to pass access token alng with the request.
        var urlRequest = URLRequest.init(url: url!)
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        if let path = Bundle.main.path(forResource: "rgsso_configuration_\(Config.environment)", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let clientId = jsonResult["client_id"] as? String {
                    urlRequest.setValue(clientId, forHTTPHeaderField: "client_id")
                }
            } catch {
            }
        }
        
        if showActivityIndicator == true{
            imageView?.showActivityIndicator()
        }
            
        downloadManager.download(urlRequest, filter: filter) { response in
            if let image = response.result.value {
                
                if imageView?.tag == tagToUseForCheck {
                    DispatchQueue.main.async {
                        imageView?.image = image
                    }
                    
                    if self.completionHandler != nil{
                        self.completionHandler!(image)
                    }
                }
            }else {
                if let error = response.error {
                    if errorHandler != nil{
                        errorHandler!(error)
                    }
                }
            }
            
            DispatchQueue.main.async {
                imageView?.hideActivityIndicator()
            }
        }
    }
    
    public func setAsyncImageForButton(button:UIButton?, filter:AspectScaledToFillSizeCircleFilter?, fromPartialURLPath URLPath: String?,
                                       placeholderImage: UIImage?,
                                       useTag tag: Int?,
                                       placeholderFillColor fillColor: UIColor?,
                                       showActivityIndicator:Bool? = true,
                                       completion completionHandler:CompletionHandler? = nil,
                                       error errorHandler:ErrorHandler? = nil) {
        
        if placeholderImage != nil {
            button?.setBackgroundImage(placeholderImage, for: .normal)
        } else {
            button?.setBackgroundImage(nil, for: .normal)
        }
        
        if fillColor != nil {
            button?.backgroundColor = fillColor
        } else {
            button?.backgroundColor = .clear
        }
        
        guard URLPath != nil else {
            return
        }
        
        if tag != nil {
            button?.tag = tag!
        }
        
        let tagToUseForCheck = button?.tag
        
        let url = URL(string: URLPath!)
        if url == nil {
            return
        }
        
        let urlRequest = URLRequest.init(url: url!)
        
        if let cachedImage = imageCache.image(withIdentifier: URLPath!) {
            if button?.tag == tagToUseForCheck {
                button?.setBackgroundImage(cachedImage, for: .normal)
            }
            return
        }
        
        if showActivityIndicator == true{
            button?.showActivityIndicator()
        }
        
        downloadManager.download(urlRequest, filter: filter) { response in
            debugPrint(response.result)
            
            if let image = response.result.value {
                self.imageCache.add(image, withIdentifier: URLPath!)
                
                if button?.tag == tagToUseForCheck {
                    DispatchQueue.main.async {
                        button?.setBackgroundImage(image, for: .normal)
                    }
                }
                
                if self.completionHandler != nil{
                    self.completionHandler!(image)
                }
            } else {
                if let error = response.error {
                    if errorHandler != nil{
                        errorHandler!(error)
                    }
                }
            }
            
            DispatchQueue.main.async {
                button?.hideActivityIndicator()
            }
        }
    }
    
    
    func cicleFilter(size: CGSize) -> AspectScaledToFillSizeCircleFilter {
        return AspectScaledToFillSizeCircleFilter(size: size)
    }
}

