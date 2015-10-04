//
//  ProfileTableViewCell.swift
//  Ten
//
//  Created by Yifang Zhang on 10/3/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    var ProfileBtn = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("init the ProfileTableViewCell")
        // Initialization code
        ProfileBtn.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        ProfileBtn.center = CGPointMake(self.frame.width/2, self.frame.height/2)
        ProfileBtn.setBackgroundImage(UIImage(named: "user_pic_88"), forState: UIControlState.Normal)
        //ProfileBtn.addTarget(<#T##target: AnyObject?##AnyObject?#>, action: <#T##Selector#>, forControlEvents: <#T##UIControlEvents#>)
        self.addSubview(ProfileBtn)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
