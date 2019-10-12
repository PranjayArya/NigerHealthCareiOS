//
//  BaseTableViewController.swift
//  Reach
//
//  Created by DelTen Obino on 12/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

open class BaseTableViewController: UITableViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

   open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    open override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
    
    // MARK: - Actions
    @objc func buttonMenuDidPressed(_ sender: AnyObject) {
    }
    
    @objc func actionBackButton(_ sender: AnyObject) {
    }

}
