//
//  TenUserModel.swift
//  Ten
//
//  Created by Yifang Zhang on 10/12/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//  Heavily Modified by Yumen Tsao on 11/01/15.

/*
Note: This model follows c sharp naming convention since is used with ASP .Net
Backend.

*/

class TenUser: NSObject {
    
    let PhoneType : Int8 = 0
    
    var UserIndex : Int?
    var UserName : String
    var Gender : Int8
    var Birthday : NSDate
    var JoinedDate : NSDate
    var PCoin : Double
    var OuterScore : Int
    var InnerScore : Int
    var Energy : Int
    var Hobby : String?
    var Quote : String?
    var Lati : Double?
    var Longi : Double?
    
    init(userName : String, gender : Int8, birthday : NSDate, joinedDate : NSDate,
        pCoin : Double, outerScore : Int, innerScore : Int, energy : Int) {
            self.UserName = userName
            self.Gender = gender
            self.Birthday = birthday
            self.JoinedDate = joinedDate
            self.PCoin = pCoin
            self.OuterScore = outerScore
            self.InnerScore = innerScore
            self.Energy = energy
    }
    
    
    
    func updateCoordinates(lati : Double, longi : Double) -> Bool {
        self.Lati = lati
        self.Longi = longi
        return true
    }
}
