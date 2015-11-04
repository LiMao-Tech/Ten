//
//  TenLogin.swift
//  Ten
//
//  Created by Yumen Cao on 11/1/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//  Heavily Modified by Yumen Tsao on 11/01/15.


/*
Note: This model follows c sharp naming convention since is used with ASP .Net
Backend.

*/


class TenLogin : NSObject {
    var LoginIndex : Int?
    var UserIndex : Int?
    var UserID : String
    var UserPWD : String
    var LastLogin : NSDate
    var DeviceUUID : [UInt8]    // 16 bytes == 128 bits
    var DeviceToken : [UInt8]   // 64 bytes
    var HashValue : [UInt8]     // 64 bytes
    
    init(userID : String, userPWD : String, lastLogin : NSDate,
        deviceUUID : [UInt8], deviceToken : [UInt8], hashValue : [UInt8]) {
        
        self.UserID = userID
        self.UserPWD = userPWD
        self.LastLogin = lastLogin
        self.DeviceUUID = deviceUUID
        self.DeviceToken = deviceToken
        self.HashValue = hashValue
    }
}
