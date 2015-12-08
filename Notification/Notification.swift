//
//  Notification.swift
//  Ten
//
//  Created by gt on 15/10/12.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit
enum infoType{
    case SYSTEM,NOTIFICATION
}

class Notification: NSObject {
    var title = "TEN Team"
    var detail:NSString = "this is a long long long long long long long long long long long long long long long long long long long long longlong long long long long long long longlong long long long long long long long text"
    var time = "15:36"
    var type:infoType = infoType.SYSTEM
}
