//
//  TenUserModel.swift
//  Ten
//
//  Created by Yifang Zhang on 10/12/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit
import AFNetworking

class TenUserModel: NSObject {
    
    var user_index : Int?
    var user_id : String?
    var user_name : String?
    var gender : Int? // 0 is male, 1 is female
    var birth_date : NSDate?
    var joined_date : NSDate?
    var last_login_datetime : NSDate?
    var p_coin : String? // TODO: fix me
    var phone_type : String? // 0 is IOS, 1 is android
    var outer_score : Int?
    var inner_score : Int?
    var energy : Int?
    var quote : String?
    var latitude : Double?
    var longitude : Double?
    
    func initWithDefaultData(withUserIndex userIndex : Int){
    
        self.user_index = userIndex
        self.user_id = ""
        self.user_name = ""
        self.gender = -1 // unassigned
        self.birth_date = NSDate()
        self.joined_date = NSDate()
        self.last_login_datetime = NSDate()
        self.p_coin = ""
        self.phone_type = "1"
        self.outer_score = -1
        self.inner_score = -1
        self.energy = -1
        self.quote = ""
        self.latitude = 0.0
        self.longitude = 0.0
        
    }
    
    func initWithAllParameters (user_id user_id: String, user_name: String, gender:Int, birth_date: NSDate, joined_date: NSDate, last_login_datetime: NSDate, p_coin: String, outer_score: Int, inner_score: Int, energy: Int, quote: String, latitude: Double, longitude: Double ){
    
        //self.user_index = user_index
        self.user_id = user_id
        self.user_name = user_name
        self.gender = gender // unassigned
        self.birth_date = birth_date
        self.joined_date = joined_date
        self.last_login_datetime = last_login_datetime
        self.p_coin = p_coin
        self.phone_type = "1"
        self.outer_score = outer_score
        self.inner_score = inner_score
        self.energy = energy
        self.quote = quote
        self.latitude = latitude
        self.longitude = longitude
    
    }
    
    func createUserToServer(){
        
        // upload using POST:
        // TODO: error on AFNetworking connect with background
        
        let postURL = "http://limaoten.azurewebsites.net/api/tenusers"
        
        let manager = AFHTTPRequestOperationManager()
        //"user_id" : user.user_id! as NSString , "user_name" : user.user_name! as NSString, "gender" : (user.gender?.description)! as NSString, "birth_date" : user.birth_date?.description, "joined_date" : user.joined_date?.description, "last_login_datetime" : user.last_login_datetime?.description, "p_coin" : user.p_coin, "outer_score" : user.outer_score?.description, "inner_score" : user.inner_score?.description, "energy" : user.energy?.description, "quote" : user.quote, "latitude" : user.latitude?.description, "longitude" : user.longitude?.description
        
        let userID = self.user_id! as NSString
        let userName = self.user_name! as NSString
        let gender = (self.gender?.description)! as NSString
        let birthDate = (self.birth_date?.description)! as NSString
        let joinedDate = (self.joined_date?.description)! as NSString
        let lastLoginDate = (self.last_login_datetime?.description)! as NSString
        let pCoin = self.p_coin! as NSString
        let outerScore = (self.outer_score?.description)! as NSString
        let innerScore = (self.inner_score?.description)! as NSString
        let energy = (self.energy?.description)! as NSString
        let quote = self.quote! as NSString
        let latitude = (self.latitude?.description)! as NSString
        let longitude = (self.longitude?.description)! as NSString
        
        let parameters = [
            "user_id" : userID,
            "user_name" : userName,
            "gender" : gender,
            "birth_date" : birthDate,
            "joined_date" : joinedDate,
            "last_login_datetime" : lastLoginDate,
            "p_coin" : pCoin,
            "phone_type" : "1",
            "outer_score" : outerScore,
            "inner_score" : innerScore,
            "energy" : energy,
            "quote" : quote,
            "latitude" : latitude,
            "longitude" : longitude
        ]
        
        //manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        //manager.responseSerializer.acceptableContentTypes =
        
        manager.POST( postURL,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("the respond object is: ")
                print( operation.responseData )
                //let str = NSString(data: responseObject! as! NSData, encoding: NSUTF8StringEncoding)
                //print(str);
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                //let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                //print(NSString(data: data, encoding: NSUTF8StringEncoding))
        })
        
    }
    
    
    func putLocationToServer(withUser user: TenUserModel){
        
        let postURL = "http://limaoten.azurewebsites.net/api/tenusers/5"
        
        let manager = AFHTTPRequestOperationManager()
        
        
        let userIndex = "5" as NSString
        let userID = user.user_id! as NSString
        let userName = user.user_name! as NSString
        let gender = (user.gender?.description)! as NSString
        let birthDate = (user.birth_date?.description)! as NSString
        let joinedDate = (user.joined_date?.description)! as NSString
        let lastLoginDate = (user.last_login_datetime?.description)! as NSString
        let pCoin = user.p_coin! as NSString
        let outerScore = (user.outer_score?.description)! as NSString
        let innerScore = (user.inner_score?.description)! as NSString
        let energy = (user.energy?.description)! as NSString
        let quote = user.quote! as NSString
        let latitude = (user.latitude?.description)! as NSString
        let longitude = (user.longitude?.description)! as NSString
        
        let parameters = [
            "user_index" : userIndex,
            "user_id" : userID,
            "user_name" : userName,
            "gender" : gender,
            "birth_date" : birthDate,
            "joined_date" : joinedDate,
            "last_login_datetime" : lastLoginDate,
            "p_coin" : pCoin,
            "phone_type" : "1",
            "outer_score" : outerScore,
            "inner_score" : innerScore,
            "energy" : energy,
            "quote" : quote,
            "latitude" : latitude,
            "longitude" : longitude
        ]
        
        //manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        //manager.responseSerializer.acceptableContentTypes =
        
        manager.PUT( postURL,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                //println(“JSON: “ + responseObject.description)
                print("JSON success" )
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error --- PUT ----: " + error.localizedDescription)
        })
        
        
    }
    
    func requestNearbyUserInfoFromServer(withDistance distance : Double){
    
        let square = self.calculateSquare(withDistance: distance, lat_start: self.latitude!, lon_start: self.longitude!)
        
        //print("square is: \(square)" )
        let postURL = "http://limaoten.azurewebsites.net/api/TenUsers"
        
        let manager = AFHTTPRequestOperationManager()
        
        let nLat = (square[0].description)! as NSString
        let sLat = (square[4].description)! as NSString
        let wLongi = (square[7].description)! as NSString
        let eLongi = (square[3].description)! as NSString
        
        let parameters = ["nLat": nLat, "sLat": sLat, "wLongi" : wLongi, "eLongi" : eLongi]
        
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.GET( postURL,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("the respond object is: ")
                print( responseObject.description )
                //TODO: This is the object data in JSON, use it in the real functions
                
                
                
                //let str = NSString(data: responseObject! as! NSData, encoding: NSUTF8StringEncoding)
                //print(str);
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                //let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                //print(NSString(data: data, encoding: NSUTF8StringEncoding))
        })
        
        
    
    }
    
    
    func calculateSquare(withDistance distance: Double, lat_start: Double, lon_start: Double) -> NSMutableArray{
        
        let locationSquare = NSMutableArray(capacity: 4)
        
        // Calculate the
        // φ2 = asin( sin φ1 ⋅ cos δ + cos φ1 ⋅ sin δ ⋅ cos θ )
        // λ2 = λ1 + atan2( sin θ ⋅ sin δ ⋅ cos φ1, cos δ − sin φ1 ⋅ sin φ2 )
        
        
        
        let lat_R_start = lat_start * M_PI/180
        let lon_R_start = lon_start * M_PI/180
        
        for(var i=0.0; i<4; i++){
            
            // 0 represents north, 90 is east, 180 is south and 270 is west
            let bearing = 0.0 + (i)*90.0
            let bearing_R = bearing * M_PI/180
            
            
            
            let Radius = 6371000.0 // 6371km earth radius
            let angDistance = distance / Radius
            
            let lat_R_end = asin( sin(lat_R_start) * cos(angDistance) + cos(lat_R_start) * sin(angDistance) * cos(bearing_R) )
            
            let lon_R_end = lon_R_start + atan2( sin(bearing_R) * sin(angDistance) * cos(lat_R_start) , cos(angDistance) - sin(lat_R_start) * sin(lat_R_end) )
            
            let lat_end = lat_R_end/M_PI * 180
            let lon_end = lon_R_end/M_PI * 180
            
            print(" \(i)th direction of current location for 10km is: \(lat_end) and \(lon_end). ")
            
            locationSquare[Int(i*2)] = lat_end
            locationSquare[Int(i*2)+1] = lon_end
            
        }
        
        
        return locationSquare
        
    }
    

}
