//
//  FormSectionDescriptor.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 26/05/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

public final class FormSectionDescriptor {
    
    // MARK: Properties
    
    public var rows: [FormRowDescriptor] = []
    
    public var headerTitle: String?
    public var footerTitle: String?
    
    public var headerView: UIView?
    public var footerView: UIView?
    
    public var headerViewHeight: CGFloat = UITableViewAutomaticDimension
    public var footerViewHeight: CGFloat = UITableViewAutomaticDimension
    
    // MARK: Init
    
    public init(headerTitle: String?, footerTitle: String?) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}
