//
//  TenUserModal.swift
//  Ten
//
//  Created by Yifang Zhang on 10/12/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

class TenUserModal: NSObject {
    
    var user_index : Int?
    var user_id : String?
    var user_name : String?
    var gender : Int? // 0 is male, 1 is female
    var birth_date : NSDate?
    var joined_date : NSDate?
    var last_login_datetime : NSDate?
    var p_coin : String? // TODO: fix me
    var outer_score : Int?
    var inner_score : Int?
    var energy : Int?
    var quote : String?
    var latitude : Float?
    var longitude : Float?
    
    func initWithDefaultData(withUserIndex userIndex : Int){
    
        self.user_index = userIndex
        self.user_id = ""
        self.user_name = ""
        self.gender = -1 // unassigned
        self.birth_date = NSDate()
        self.joined_date = NSDate()
        self.last_login_datetime = NSDate()
        self.p_coin = ""
        self.outer_score = -1
        self.inner_score = -1
        self.energy = -1
        self.quote = ""
        self.latitude = 0.0
        self.longitude = 0.0
        
    }
    
    func initWithAllParameters (userIndex user_index: Int, user_id: String, user_name: String, gender:Int, birth_date: NSDate, joined_date: NSDate, last_login_datetime: NSDate, p_coin: String, outer_score: Int, inner_score: Int, energy: Int, quote: String, latitude: Float, longitude: Float ){
    
        self.user_index = user_index
        self.user_id = user_id
        self.user_name = user_name
        self.gender = gender // unassigned
        self.birth_date = birth_date
        self.joined_date = joined_date
        self.last_login_datetime = last_login_datetime
        self.p_coin = p_coin
        self.outer_score = outer_score
        self.inner_score = inner_score
        self.energy = energy
        self.quote = quote
        self.latitude = latitude
        self.longitude = longitude
    
    }

}
