//
//  ProfileViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/2/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit
//import ELCImagePickerController

class ProfileViewController: UIViewController,UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    // Image Picker Variables //
    var chosenImage : UIImage?
    var counter : Int?
    //var ELCpicker : ELCImagePickerController? = ELCImagePickerController()
    var picker : UIImagePickerController? = UIImagePickerController()
    
    // scrollView Variables //
    var scrollView: UIScrollView?
    
    var buttonProfile : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        chosenImage = UIImage()
        
        print("\(self.view.frame.width) and \(self.view.frame.height)")
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/8))
        self.scrollView?.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+SCREEN_HEIGHT/16)
        self.scrollView!.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*1.5)
        
        //let scrowViewWidth = SCREEN_WIDTH
        //let scrowViewHeight = SCREEN_HEIGHT
        
        // init buttons
        let button = initButton(posX: SCREEN_WIDTH/2, posY: SCREEN_HEIGHT*1.5 - 50, btnWidth: 430/2, btnHeight: 75/2, imageName: "btn_done", targetAction: "toRadarPage")
        buttonProfile = initButton(posX: SCREEN_WIDTH/2, posY: SCREEN_HEIGHT/5, btnWidth: 110/3*2, btnHeight: 110/3*2, imageName: "user_pic_110", targetAction: "toImagePicker")
        
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
        self.scrollView!.addSubview(buttonProfile!)
        
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
        
        /*----------- ELCImagePicker Edition -----------*/
        
        
        
        
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
    
    // MARK: Entering the image picker
    func toImagePicker(){
        //
        print("going to do imagepicker here")
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openCamera()
                
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
            {
                UIAlertAction in
                
            }
        
        // Add the actions
        
        //ELCpicker?.imagePickerDelegate = self
        //ELCpicker?.maximumImagesCount = 1 //TODO: Tuantuan, this is where you can change the number of image you want to select
        picker?.delegate = self
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            print("Please use an IPhone for this action")
        }
    }
    
    func openCamera()
    {
        
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(picker!, animated: true, completion: nil)

        }
        else
        {
            openGallary()
        }
    }
    func openGallary()
    {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)

        }
        else
        {
            print("Please use an IPhone for this action")
        }
    }
    

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // TODO: add image into profile
        // chosenImages
        picker .dismissViewControllerAnimated(true, completion: nil)
        let image=info[UIImagePickerControllerOriginalImage] as? UIImage
        chosenImage = image
        self.buttonProfile?.setImage(image, forState: UIControlState.Normal)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}// end of the class
