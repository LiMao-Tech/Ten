//
//  CalculationViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/12/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit
import AFNetworking
import CoreLocation

class CalculationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*let TenUser = TenUserModel();
        TenUser.initWithAllParameters(user_id: "exampleid_12", user_name: "Luren0", gender: 0, birth_date: NSDate(), joined_date: NSDate(), last_login_datetime: NSDate(), p_coin: "100.00", outer_score: 10, inner_score: 10, energy: 10, quote: "quote", latitude: 31.0, longitude: 121.0)
        //TenUser.createUserToServer()
        //TenUser.longitude = 999.9765
        //putLocationToServer(withUser: TenUser)
        TenUser.requestNearbyUserInfoFromServer(withDistance: 100000.0)
        
        // Do any additional setup after loading the view.*/
        
        let lat = CLLocationDegrees.init(floatLiteral: 31.0) //上海地｀区经纬度
        let lon = CLLocationDegrees.init(floatLiteral: 121.0)
        let loc = CLLocation.init(latitude: lat, longitude: lon)
        
        let geocoder = CLGeocoder.init()
        geocoder.reverseGeocodeLocation(loc, completionHandler: {(placemarks, error) -> Void in
            //print(loc)
            
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if let validPlacemark = placemarks?[0] {
                let pm = validPlacemark as CLPlacemark
                //print("\(pm.administrativeArea)")
                var locationString = "我现在在："
                if (pm.administrativeArea != nil){
                    locationString = locationString + "\(pm.administrativeArea! as String)地区"
                    if(pm.locality != nil){
                        locationString = locationString + "的\(pm.locality! as String)"
                    }
                    print(locationString)
                }
                //print(pm.locality)
                else{
                    print("无法解析本位置的城市归属，请联系苹果官方Geocoder主数据库")
                }
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
