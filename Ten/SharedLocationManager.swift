//
//  SharedLocationManager.swift
//  Ten
//
//  Created by Yifang Zhang on 8/25/15.
//  Copyright (c) 2015 LiMao Tech. All rights reserved.
//  Reference from: http://derpturkey.com/cllocationmanager-singleton/
//  and from: https://github.com/igroomgrim/CLLocationManager-Singleton-in-Swift/blob/master/LocationService.swift
//  Into the Swift version from the obj-c code
//

import UIKit
import Foundation
import CoreLocation

class SharedLocationManager: NSObject, CLLocationManagerDelegate {
    
    static let SharedInstance = SharedLocationManager()
    
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    
    override init(){
    
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.distanceFilter = 200
        self.locationManager?.delegate = self
    
    }
    
    func startUpdatingLocation() {
        println("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        println("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var location: AnyObject? = (locations as NSArray).lastObject
        self.currentLocation = location as? CLLocation
        
        //TODO: assign the location into the coordinate 2D
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        if (error != nil) {
            println("Update Location Error : \(error.description)")
        }
    }
    
    func updateLocation(currentLocation:CLLocation){
        let lat = currentLocation.coordinate.latitude
        let lon = currentLocation.coordinate.longitude
    }
   
}
