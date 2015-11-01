//
//  SettingButton.swift
//  Ten
//
//  Created by gt on 15/10/18.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit
enum systemType{
    case System,Notification
}
enum chatType{
    case Active,Inactive
}
class SettingButton: UIButton {
    var model:pcoinModelType = .Pcoin
    var systemModel:systemType = .System
    var chatModel:chatType = .Active
    var seletedImage:UIImage!
    var normalImage:UIImage!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}