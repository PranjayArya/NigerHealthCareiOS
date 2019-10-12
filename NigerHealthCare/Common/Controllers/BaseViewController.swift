//
//  BaseViewController.swift
//  Reach
//
//  Created by Abhayam Rastogi on 14/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController  {
    
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Public methods
    func setupLeftBackBarButtonItem(target:AnyObject){
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action: #selector(actionBackButton(_:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    
    func setupLeftDismissBarButtonItem(target:AnyObject, withAction selector: Selector){
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(named:"close"), style: .plain, target: self, action: selector)
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    func setupLeftMenuBarButtonItem(target:AnyObject, withAction sel: Selector? = nil){
        let selector = sel ?? #selector(buttonMenuDidPressed(_:))
        let sideMenuBarButton = UIBarButtonItem(image: UIImage(named:"sideBarIcon"), style: .plain, target: target, action: selector)
        self.navigationItem.leftBarButtonItem = sideMenuBarButton
    }
    
    func setupRightMenuBarButtonItem(target:AnyObject) -> UIBarButtonItem{
        return UIBarButtonItem(image: UIImage(named:"nav-menu"), style: .plain, target: self, action: #selector(actionMenuButton(_:)))
    }
    
    func setupRightNotificationBarButtonItem(target:AnyObject) -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named:"nav_bell"), style: .plain, target: self, action: #selector(actionNotifyButton(_:)))
    }
    
    func setupRightNotificationBarWithDotButtonItem(target:AnyObject) -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named:"nav_bell_selected"), style: .plain, target: self, action: #selector(actionNotifyButton(_:)))
    }
    
    func setupCommonRightNavigationButtons(target: AnyObject) {
        self.navigationItem.rightBarButtonItems = [setupRightNotificationBarButtonItem(target: target), setupRightMenuBarButtonItem(target: target)]
    }
    
    func setupCommonRightNavigationButtonsWithNotificationDotIcon(target: AnyObject) {
        self.navigationItem.rightBarButtonItems = [setupRightNotificationBarWithDotButtonItem(target: target), setupRightMenuBarButtonItem(target: target)]
    }
    
    func setupRightGoalBarButtonItem(target:AnyObject) -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named:"settingsNav"), style: .plain, target: self, action: #selector(actionGoalButton(_:)))
    }
    
    func setupRightRefreshBarButtonItem(target:AnyObject) -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(actionRefreshButton(_:)))
    }

    // MARK: - Actions
    @objc func buttonMenuDidPressed(_ sender: AnyObject) {
    }
    
    @objc func actionBackButton(_ sender: AnyObject) {
    }
    
    @objc func actionMenuButton(_ sender: AnyObject) {
    }
    
    @objc func actionProfileButton(_ sender: AnyObject) {
    }
    
    @objc func actionNotifyButton(_ sender: AnyObject) {
    }
    
    @objc func actionGoalButton(_ sender: AnyObject) {
    }
    
    @objc func actionRefreshButton(_ sender: AnyObject) {
    }
}

