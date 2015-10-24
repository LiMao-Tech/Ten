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
    
    var gifView:UIImageView!
    var lvoneBtn:LevelButton!
    var lvtwoBtn:LevelButton!
    var lvthreeBtn:LevelButton!
    var lvfourBtn:LevelButton!
    var lvfiveBtn:LevelButton!
    var lvsixBtn:LevelButton!
    var lvsevenBtn:LevelButton!
    var lveightBtn:LevelButton!
    var lvnineBtn:LevelButton!
    var lvtenBtn:LevelButton!
    var btns = Array<UIButton!>()
    // view loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .Black
        // set circularMenu
        self.circularMenuVC.circularMenuDelegate = self
        self.circularMenuVC.view.frame = UIScreen.mainScreen().bounds
        
        //setupButtons
        setupButtons()
        
        // add location observer
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "locationChanged:",
            name: locationNotiName,
            object: nil)
        
        //gifView
//        let x = (SCREEN_WIDTH-250)/2
//        let y = (SCREEN_HEIGHT-250)/2
//        gifView = UIImageView(frame: CGRectMake(x, y, 250, 250))
//        let imageArray = [UIImage(named: "RadarGreen0")!,UIImage(named: "RadarGreen1")!,UIImage(named: "RadarGreen2")!,UIImage(named: "RadarGreen3")!,UIImage(named: "RadarGreen4")!,UIImage(named: "RadarGreen5")!,UIImage(named: "RadarGreen6")!,UIImage(named: "RadarGreen7")!,UIImage(named: "RadarGreen8")!,UIImage(named: "RadarGreen9")!,UIImage(named: "RadarGreen10")!,UIImage(named: "RadarGreen11")!]
//        gifView.animationImages = imageArray
//        gifView.animationDuration = 0.4
//        gifView.animationRepeatCount = 20
//        gifView.startAnimating()
//        gifView.backgroundColor = UIColor.clearColor()
    
        // config buttons
        menuButton.setImage(UIImage(named: "btn_menu"), forState: UIControlState.Normal)
        randomButton.setImage(UIImage(named: "btn_radar_random"), forState: UIControlState.Normal)
        menuButton.addTarget(self, action: "menuButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        randomButton.addTarget(self, action: "randomButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(gifView)
        self.view.addSubview(menuButton)
        self.view.addSubview(randomButton)
    }
    
    func setupButtons(){
        var btnArray = [lvoneBtn,lvtwoBtn,lvthreeBtn,lvfourBtn,lvfiveBtn,lvsixBtn,lvsevenBtn,lveightBtn,lvnineBtn,lvtenBtn]
        let marginw:CGFloat = 30
        let marginh:CGFloat = 20
        let iconw:CGFloat = 58
        let iconh:CGFloat = 67
        let x = (SCREEN_WIDTH - iconw*3 - marginw*2)/2
        let y:CGFloat = 90
        for i in 0...btnArray.count-2{
            let row = i/3
            let col = i%3
            btnArray[i] = LevelButton(frame: CGRectMake(x + CGFloat(row)*(marginw+iconw), y + CGFloat(col)*(marginh+iconh), iconw, iconh))
            btnArray[i].level = "\(i+1)"
            btnArray[i].setImage(UIImage(named: "btn_l\(i+1)_unlock"), forState: UIControlState.Normal)
            btnArray[i].addTarget(self, action: "levelSelect:", forControlEvents: UIControlEvents.TouchUpInside)
            self.circularMenuVC.view.addSubview(btnArray[i])
//            btnArray[i].hidden = true
            btns.append(btnArray[i])
        }
        lvtenBtn = LevelButton(frame: CGRectMake(x+marginw+iconw, y + 3*(marginh+iconh), iconw, iconh))
        lvtenBtn.setImage(UIImage(named: "btn_l10_lock"), forState: UIControlState.Normal)
        lvtenBtn.level = "10"
        lvtenBtn.addTarget(self, action: "levelSelect:", forControlEvents: UIControlEvents.TouchUpInside)
        self.circularMenuVC.view.addSubview(lvtenBtn)
//        lvtenBtn.hidden = true
        btns.append(lvtenBtn)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //levelButton actions
    func levelSelect(sender:LevelButton){
        self.navigationController?.navigationBar.hidden = false
        let lVC = LevelUserController()
        lVC.level = sender.level
        self.navigationController?.pushViewController(lVC, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_radar")!)
    }
    
    // button actions
    func menuButtonAction() {
        self.view.addSubview(self.circularMenuVC.view)
        self.circularMenuVC.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_radar")!)
        circularMenuVC.show()
    }
    func randomButtonAction() {
        self.navigationController?.navigationBar.hidden = false
        let rVC = RandomUserController()
        self.navigationController?.pushViewController(rVC, animated: true)
    }
    
    
    func circularMenuClickedButtonAtIndex(buttonIndex: Int32) {
        // did select subMenu
        
        print("selected: \(buttonIndex)")
        
        //TODO: add more pos to different pages
        
        switch buttonIndex {
        case 0:
            print("Not Implemented yet!")
            self.navigationController?.navigationBar.hidden = false
            let rpVC = RegistProfileViewController()
            self.navigationController?.pushViewController(rpVC, animated: true)
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
            let cVC = ChatViewController()
            self.navigationController?.pushViewController(cVC, animated: true)
            
        case 5:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let nVC = NotificationViewController()
            self.navigationController?.pushViewController(nVC, animated: true)
            
        case 6:
            self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.hidden = false
            let sVC = SettingsViewController()
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
