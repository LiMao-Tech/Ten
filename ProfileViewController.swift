//
//  ProfileViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/2/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit
import ELCImagePickerController

class ProfileViewController: UIViewController,UIAlertViewDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate {

    // Image Picker Variables //
    var chosenImages : NSMutableArray?
    var counter : Int?
    
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        
        
        print("\(self.view.frame.width) and \(self.view.frame.height)")
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/8))
        self.scrollView?.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+SCREEN_HEIGHT/16)
        self.scrollView!.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*1.5)
        
        //let scrowViewWidth = SCREEN_WIDTH
        //let scrowViewHeight = SCREEN_HEIGHT
        
        // init buttons
        let button = initButton(posX: SCREEN_WIDTH/2, posY: SCREEN_HEIGHT*1.5 - 50, btnWidth: 430/2, btnHeight: 75/2, imageName: "btn_done", targetAction: "toRadarPage")
        let buttonProfile = initButton(posX: SCREEN_WIDTH/2, posY: SCREEN_HEIGHT/5, btnWidth: 110/3*2, btnHeight: 110/3*2, imageName: "user_pic_110", targetAction: "toImagePicker")
        
        // init labels
        let basicInfoLabel = initLabel(posX: SCREEN_WIDTH/10, posY: SCREEN_HEIGHT*3/12, labelWidth: 200, labelHeight: 100, labelText: "Basic Info")
        let userNameLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*4/12, labelWidth: 200, labelHeight: 100, labelText: "Username")
        let dateOfBirthLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*5/12, labelWidth: 200, labelHeight: 100, labelText: "Date of Birth*")
        let sexLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*6/12, labelWidth: 200, labelHeight: 100, labelText: "Sex*")
        let marriageLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*7/12, labelWidth: 200, labelHeight: 100, labelText: "Marriage")
        let emailLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*8/12, labelWidth: 200, labelHeight: 100, labelText: "Email")
        let hobbyLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*9/12, labelWidth: 200, labelHeight: 100, labelText: "Hobby")
        let moreDetailLabel = initLabel(posX: SCREEN_WIDTH/10, posY: SCREEN_HEIGHT*10/12, labelWidth: 200, labelHeight: 100, labelText: "More Details")
        let statusLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*11/12, labelWidth: 200, labelHeight: 100, labelText: "Status")
        let InnerLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*13/12, labelWidth: 200, labelHeight: 100, labelText: "Inner")
        let OuterLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*14/12, labelWidth: 200, labelHeight: 100, labelText: "Outer")
        let EnergyLabel = initLabel(posX: SCREEN_WIDTH/8, posY: SCREEN_HEIGHT*15/12, labelWidth: 200, labelHeight: 100, labelText: "Energy")
        
        
        self.scrollView!.addSubview(button)
        self.scrollView!.addSubview(buttonProfile)
        
        self.scrollView!.addSubview(basicInfoLabel)
        self.scrollView!.addSubview(userNameLabel)
        self.scrollView!.addSubview(dateOfBirthLabel)
        self.scrollView!.addSubview(sexLabel)
        self.scrollView!.addSubview(marriageLabel)
        self.scrollView!.addSubview(emailLabel)
        self.scrollView!.addSubview(hobbyLabel)
        self.scrollView!.addSubview(hobbyLabel)
        self.scrollView!.addSubview(moreDetailLabel)
        self.scrollView!.addSubview(statusLabel)
        self.scrollView!.addSubview(InnerLabel)
        self.scrollView!.addSubview(OuterLabel)
        self.scrollView!.addSubview(EnergyLabel)
        
        
        self.view.addSubview(self.scrollView!)
        //self.scrollView.

        // Do any additional setup after loading the view.
    }
    
    // UI Helper Functions
    func initButton(posX posX: CGFloat, posY: CGFloat, btnWidth: CGFloat, btnHeight: CGFloat, imageName: String, targetAction: Selector) -> UIButton{
        
        /*UIButton(frame: CGRectMake(0, 0, 110, 110))
        buttonProfile.center = CGPointMake(self.scrollView!.frame.width/2, self.scrollView!.frame.height/5)
        buttonProfile.setImage(UIImage(named: "user_pic_110"), forState: UIControlState.Normal)
        buttonProfile.addTarget(self, action: "toImagePicker", forControlEvents: UIControlEvents.TouchUpInside)*/
        
        let result = UIButton(frame: CGRectMake(0, 0, btnWidth, btnHeight))
        result.center = CGPointMake(posX, posY)
        result.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        result.addTarget(self, action: targetAction, forControlEvents: UIControlEvents.TouchUpInside)
        
        return result
    }
    
    func initLabel(posX posX:CGFloat, posY: CGFloat, labelWidth: CGFloat, labelHeight: CGFloat, labelText: String) -> UILabel{
    
        /*UILabel(frame: CGRectMake(scrowViewWidth/10, scrowViewHeight*3/10, 200, 100))
        basicInfoLabel.text = "Basic Info"
        basicInfoLabel.font = UIFont(name: "Arial-Bold", size: 20)
        basicInfoLabel.textColor = UIColor.redColor()
        basicInfoLabel.numberOfLines = 1;
        //print("\(scrowViewWidth/8) and \(scrowViewHeight*3/10)")*/
        
        let resultLabel = UILabel(frame: CGRectMake(posX, posY, labelWidth, labelHeight))
        resultLabel.text = labelText
        resultLabel.font = UIFont(name: "Arial-Bold", size: 20)
        resultLabel.textColor = UIColor.redColor()
        resultLabel.numberOfLines = 1;
        return resultLabel
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func toRadarPage(){
        
        //TODO: will need to add user data into this area
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func toImagePicker(){
        // TODO: imagepicker
        print("going to do imagepicker here")
    }
    
    
    

}// end of the class
