//
//  AppDelegate.swift
//  Ten
//
//  Created by Yumen Cao on 8/22/15.
//  Copyright (c) 2015 LiMao Tech. All rights reserved.
//

import UIKit
import Tweaks
import PureLayout
import CoreLocation
import Foundation
//import AFNetworkActivityLogger

let locationNotiName = "LocationNotification"
let updateLocationByIdURL = "http://www.code-desire.com.tw/LiMaoMVC/TenUsers/UpdateLocationByID"



let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width

let NAV_BAR_HEIGHT : CGFloat = SCREEN_HEIGHT == 568 ? 88 : 132
let SCREEN_HEIGHT_WO_NAV = SCREEN_HEIGHT - NAV_BAR_HEIGHT

let DISTANCE_FILTER : Double = 100 // meters

let PROFILE_FONT_SIZE : CGFloat = 12
let USERNAME_FONT_SIZE : CGFloat = 24

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    var window: UIWindow?
    
    //var locationManager = SharedLocationManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        NSThread.sleepForTimeInterval(3.0)
        
        //AFNetworkActivityLogger.sharedLogger().level = AFHTTPRequestLoggerLevel.AFLoggerLevelDebug
        //AFNetworkActivityLogger.sharedLogger().startLogging()
        
        // Shake to open tweaks menu
        if let rootViewController = window?.rootViewController {
            window = FBTweakShakeWindow(frame: UIScreen.mainScreen().bounds)
            window!.rootViewController = rootViewController
        }
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            sharedManager.locationManager!.requestWhenInUseAuthorization()
        }
        
        // getting the width and height
        let screenRect = UIScreen.mainScreen().bounds;
        let screenWidth = screenRect.size.width;
        let screenHeight = screenRect.size.height;
        sharedMobileInformation.gettingMobileViewBounds(screenRect);
        print([screenWidth, screenHeight])
          
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        print("in Will Resign Active")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("in Did Enter Background State")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        print("in Will Enter Foreground State")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("*********** in Did Become Active *************")
        
        // checking for location Manager's authorization status
        
        if(sharedManager.FIRST_TIME == 0){
            // do nothing
            sharedManager.FIRST_TIME = 1
            print("detected it was the first time the app runs before the determination")
        }
        else if(sharedManager.FIRST_TIME == 1){
            
            let status = CLLocationManager.authorizationStatus()
            print("status is: \(status.rawValue)")
            switch status {
            case .AuthorizedWhenInUse:
                //AUTHORIZATION_STATUS_FLAG = 1 // passed
                //sharedManager.locationManager!.startUpdatingLocation()
                break
                
            case .NotDetermined, .Restricted, .Denied:
                
                print("first time veriable is: \(sharedManager.FIRST_TIME)")
                
                print("<<<< --- in denied case --- >>>>")
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

                // keep authorization status flag to be 0;
                break
                
            default:
                // error state
                //AUTHORIZATION_STATUS_FLAG = -1
                break
            }
        }
        else{
            //error 
            print("error occured on FIRST_TIME variable")
        }
        
        // end of location manager authorization
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("in Will Terminate State, byebye")
    }


}

