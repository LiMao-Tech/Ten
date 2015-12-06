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

let sharedManager = SharedLocationManager()

class SharedLocationManager: NSObject, CLLocationManagerDelegate {
    
    static let SharedInstance = SharedLocationManager()
    
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var authorization_status: NSInteger? // 0 == non-determinate, 1 == all good, -1 == error
    var FIRST_TIME: NSInteger?
    var is_ready : NSInteger?
    
    override init(){
        
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.distanceFilter = 200
        self.locationManager?.delegate = self
        self.authorization_status = 0; // not determinated
        self.FIRST_TIME = 0;
        self.is_ready = 0;

    }
    
    func startUpdatingLocation() {
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
        
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
        is_ready = 1
        NSNotificationCenter.defaultCenter().postNotificationName(locationNotiName, object: self)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: AnyObject? = (locations as NSArray).lastObject
        self.currentLocation = location as? CLLocation
        print("location is updated ...");
        
        //TODO: assign the location into the coordinate 2D
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
            print("Update Location Error : \(error.description)")
    }
    
    func updateLocation(currentLocation:CLLocation){
        let lati = currentLocation.coordinate.latitude
        let longi = currentLocation.coordinate.longitude
        
        print(lati + longi)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // first time use of the app, status change if accepted.
        switch status {
            
        case .AuthorizedWhenInUse:
            authorization_status = 1
            startUpdatingLocation()
            NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("stopUpdatingLocation"), userInfo: nil, repeats: false)
            break
        case .Denied, .NotDetermined, .Restricted:
            break
        default:
            authorization_status = -1 // error
        }
        
        //FIRST_TIME = 1
    }
    /*
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    // first time use of the app, status change if accepted.
    switch status {
    
    case .AuthorizedWhenInUse:
    authorization_status = 1
    locationManager.startUpdatingLocation()
    break
    case .Denied, .NotDetermined, .Restricted:
    let alertController = UIAlertController(
    title: "While In Use Location Access Disabled",
    message: "In order to be notified about nearby cute boys and girls, please enable this service while in use of Ten.",
    preferredStyle: .Alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
    if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
    UIApplication.sharedApplication().openURL(url)
    }
    }
    alertController.addAction(openAction)
    
    self.window!.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    
    break
    default:
    AUTHORIZATION_STATUS_FLAG = -1 // error
    }
    
    FIRST_TIME = 1
    }
    */
    
}

