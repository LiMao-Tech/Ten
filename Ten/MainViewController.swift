//
//  ViewController.swift
//  Ten
//
//  Created by Yumen Cao on 8/22/15.
//  Copyright (c) 2015 LiMao Tech. All rights reserved.
//

import UIKit
import QuartzCore
import CoreLocation
import Foundation
import AFNetworking

class MainViewController: UIViewController, ADCircularMenuDelegate {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let menuButton = UIButton(frame: CGRectMake(0, SCREEN_HEIGHT*(BUTTON_DENO-1)/BUTTON_DENO, SCREEN_HEIGHT/BUTTON_DENO, SCREEN_HEIGHT/BUTTON_DENO))
    let randomButton = UIButton(frame: CGRectMake(SCREEN_WIDTH-SCREEN_HEIGHT/BUTTON_DENO, SCREEN_HEIGHT*(BUTTON_DENO-1)/BUTTON_DENO, SCREEN_HEIGHT/BUTTON_DENO, SCREEN_HEIGHT/BUTTON_DENO))
    
    // circular menu
    let circularMenuVC = ADCircularMenuViewController(frame: UIScreen.mainScreen().bounds)
    
    // view loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set circularMenu
        self.circularMenuVC.circularMenuDelegate = self
        self.circularMenuVC.view.frame = UIScreen.mainScreen().bounds
        
        // add location observer
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "locationChanged:",
            name: locationNotiName,
            object: nil)
        
        // config buttons
        menuButton.setImage(UIImage(named: "menuButton"), forState: UIControlState.Normal)
        randomButton.setImage(UIImage(named: "btn_radar_random"), forState: UIControlState.Normal)
        menuButton.addTarget(self, action: "menuButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        randomButton.addTarget(self, action: "randomButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuButton)
        self.view.addSubview(randomButton)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_radar")!)
    }
    
    // button actions
    func menuButtonAction() {
        self.view.addSubview(self.circularMenuVC.view)
        circularMenuVC.show()
    }
    func randomButtonAction() {
        
    }
    
    
    func circularMenuClickedButtonAtIndex(buttonIndex: Int32) {
        // did select subMenu
        
        print("selected: \(buttonIndex)")
        
        //TODO: add more pos to different pages
        
        switch buttonIndex {
        case 0:
            print("Not Implemented yet!")
        case 1:
            print("Not Implemented yet!")
        case 2:
            print("Not Implemented yet!")
        case 3:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let pVC = ProfileViewController()
            self.navigationController?.pushViewController(pVC, animated: true)
        case 4:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let cVC = ChatsTableViewController()
            self.navigationController?.pushViewController(cVC, animated: true)
            
        case 5:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let nVC = NotificationTableViewController()
            self.navigationController?.pushViewController(nVC, animated: true)
            
        case 6:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let sVC = SettingsTableViewController()
            self.navigationController?.pushViewController(sVC, animated: true)
            
        default:
            print("Not Implemented yet!")
            
        }

    }
    
    @IBAction func updateLocation(sender: AnyObject) {
        
        //nothing
        if(sharedManager.authorization_status == 1){
            sharedManager.startUpdatingLocation()
            NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("sharedManagerStopUpdatingLocation"), userInfo: nil, repeats: false)
        }
    }
    
    @objc func locationChanged(notification: NSNotification){
        //do stuff
        print("Location Changed...")
        // Stop location services, here
        if(sharedManager.is_ready == 1){
            let lati = sharedManager.currentLocation!.coordinate.latitude
            let longi = sharedManager.currentLocation!.coordinate.longitude
            
            print("\(lati) \(longi)")
            // self.postLocationToServer(longi.description, lati: lati.description)
        }
        
    }
    
    func sharedManagerStopUpdatingLocation(){
        sharedManager.stopUpdatingLocation()
    }
    
    func postLocationToServer(longi:NSString, lati: NSString){
        
        // upload using POST:
        // TODO: error on AFNetworking connect with background
        
        let manager = AFHTTPRequestOperationManager()
        let parameters = ["id":"1","latitude" : lati,"longitude" : longi]
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        //manager.responseSerializer.acceptableContentTypes =
        
        manager.POST( updateLocationByIdURL,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("the respond object is: ")
                print( operation.responseData )
                let str = NSString(data: responseObject! as! NSData, encoding: NSUTF8StringEncoding)
                print(str);
                
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                print("Error: " + error.localizedDescription)
                let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                print(NSString(data: data, encoding: NSUTF8StringEncoding))
        })
        
    }
}
