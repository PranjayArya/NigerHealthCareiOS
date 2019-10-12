//
//  SingleLabelTableViewCell.swift
//  Reach
//
//  Created by DelTen Obino on 05/09/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class SingleLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var vContainerView: UIView!
    @IBOutlet weak var lHeaderSectionLabel: ExtraSmallRegularLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
