//
//  TimeLineTableViewCell.swift
//  TwitterAppAgain
//
//  Created by yoshihisa haruyama on 9/19/15.
//  Copyright (c) 2015 yoshihisa haruyama. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!

    @IBOutlet weak var tweetLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
