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


class MainViewController: UIViewController {
    
    // variables for radial menu
    var menuButton : UIImageView = UIImageView()
    var tapView : UIView
    var radialMenu : RadialMenu!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let numRadialOptions = 7
    let menuButtonSize: CGFloat = 35.0
    let menuRadius: CGFloat = 125.0
    let subMenuRadius: CGFloat = 15.0
    var didSetupConstraints = false
    
    let colors = [UIColor.blackColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.grayColor(), UIColor.greenColor()]
    
    required init?(coder aDecoder: NSCoder) {
        menuButton = UIImageView(image: UIImage(named: "btn_menu"))
        tapView = UIView()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        //if(!defaultData.boolForKey("notFirstTime")){
            
            defaultData.setBool(true, forKey: "notFirstTime")
            
            // go tutorial
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = true
            let pVC = TutorialViewController()
            self.navigationController?.pushViewController(pVC, animated: true)
            
        //}
        //else{
        
        
            // add location observer
            NSNotificationCenter.defaultCenter().addObserver(
                self,
                selector: "locationChanged:",
                name: locationNotiName,
                object: nil)
            // set location, status, and update lati and longi
            self.initRadialMenu()
            view.addSubview(menuButton)
            view.addSubview(tapView)
            
        //}
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_radar")!)
        
    }
    override func viewDidAppear(animated: Bool) {
        
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
            let lati = sharedManager.currentLocation?.coordinate.latitude
            let longi = sharedManager.currentLocation?.coordinate.longitude
            
            print("\(lati) \(longi)")
            if((longi?.description) != nil){
                self.postLocationToServer(longi!.description, lati: lati!.description)
            }
            else{
                print("this device did not support location manager")
            }
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
                //let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                //print(NSString(data: data, encoding: NSUTF8StringEncoding))
        })
        
    }
    
    // TODO: starting the RadiaMenu
    func initRadialMenu(){
        
        /* Setup radial menu */
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "pressedButton:")
        
        var subMenus: [RadialSubMenu] = []
        for i in 0..<numRadialOptions {
            subMenus.append(self.createSubMenu(i))
        }
        
        radialMenu = RadialMenu(menus: subMenus, radius: menuRadius)
        radialMenu.center = view.center
        radialMenu.openDelayStep = 0.05
        radialMenu.closeDelayStep = 0.00
        radialMenu.minAngle = 180
        radialMenu.maxAngle = 355
        radialMenu.activatedDelay = 0.5
        radialMenu.backgroundView.alpha = 0.0
        
        radialMenu.onActivate = { subMenu in
            // did select subMenu
            let pos = subMenu.tag
            
            print("selected: \(pos)")
            
            //TODO: add more pos to different pages
            
            switch pos {
            case 0:
                print("Not Implemented yet!")
                // testing tutorial
                /*self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
                self.navigationController?.navigationBar.hidden = true
                let pVC = TutorialViewController()
                self.navigationController?.pushViewController(pVC, animated: true)*/
            case 1:
                print("Not Implemented yet!")
            case 2:
                print("Not Implemented yet!")
            case 3:
                self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
                self.navigationController?.navigationBar.hidden = false
                let pVC = ProfileCollectionViewController()
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
        
        radialMenu.onClose = {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
        view.addSubview(radialMenu)
        
        // Setup add button
        menuButton.userInteractionEnabled = true
        menuButton.alpha = 1
        
        
        tapView.center = view.center
        tapView.addGestureRecognizer(longPress)
        
        /* end of radial menu */
    }

    
    // FIXME: Consider moving this to the radial menu and making standard interaction types  that are configurable
    func pressedButton(gesture:UIGestureRecognizer) {
        switch(gesture.state) {
        case .Began:
            self.radialMenu.openAtPosition(self.menuButton.center)
        case .Ended:
            self.radialMenu.close()
        case .Changed:
            self.radialMenu.moveAtPosition(gesture.locationInView(self.view))
        default:
            break
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if (!didSetupConstraints) {
            
            // FIXME: Any way to simplify this?
            menuButton.autoAlignAxisToSuperviewAxis(.Baseline)
            menuButton.autoAlignAxisToSuperviewAxis(.Vertical)
            menuButton.autoSetDimensionsToSize(CGSize(width: menuButtonSize, height: menuButtonSize))
            
            tapView.autoAlignAxisToSuperviewAxis(.Baseline)
            tapView.autoAlignAxisToSuperviewAxis(.Vertical)
            tapView.autoSetDimensionsToSize(CGSize(width: menuButtonSize*2, height: menuButtonSize*2))
            
            didSetupConstraints = true
            
        }
    }
    
    // MARK - RadialSubMenu helpers
    
    func createSubMenu(i: Int) -> RadialSubMenu {
        var subMenu: RadialSubMenu
        let subMenuFrame = CGRect(x: 0.0, y: 0.0, width: CGFloat(subMenuRadius*2), height: CGFloat(subMenuRadius*2))
        switch i {
        case 0:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_search_female")))
        case 1:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_search_male")))
        case 2:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_search_all")))
        case 3:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "user_pic_88")))
        case 4:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_chat_normal")))
        case 5:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_notification_normal")))
        case 6:
            subMenu = RadialSubMenu(frame: subMenuFrame, imageView: UIImageView(image: UIImage(named: "btn_menu_setting")))
        default:
            print("Not implemented")
            subMenu = RadialSubMenu(frame: CGRect(x: 0.0, y: 0.0, width: CGFloat(subMenuRadius*2), height: CGFloat(subMenuRadius*2)))
        }
        
        subMenu.userInteractionEnabled = true
        subMenu.layer.cornerRadius = subMenuRadius
        subMenu.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor
        subMenu.layer.borderWidth = 1
        subMenu.tag = i
        return subMenu
    }
    
    /*
    func colorForSubMenu(subMenu: RadialSubMenu) -> UIColor {
        let pos = subMenu.tag % colors.count
        return colors[pos] as UIColor!
    }
    
    func highlightSubMenu(subMenu: RadialSubMenu) {
        let color = colorForSubMenu(subMenu)
        subMenu.backgroundColor = color.colorWithAlphaComponent(1.0)
    }
    
    func resetSubMenu(subMenu: RadialSubMenu) {
        let color = colorForSubMenu(subMenu)
        subMenu.backgroundColor = color.colorWithAlphaComponent(0.75)
    }
    */
}


