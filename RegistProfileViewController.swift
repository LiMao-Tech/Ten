//
//  RegistProfileViewController.swift
//  Ten
//
//  Created by gt on 15/10/22.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit


class RegistProfileViewController: UIViewController,UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    // Image Picker Variables //
    var chosenImage : UIImage?
    var counter : Int?
    //var ELCpicker : ELCImagePickerController? = ELCImagePickerController()
    var picker : UIImagePickerController? = UIImagePickerController()
    
    // scrollView Variables //
    var scrollView: UIScrollView?
    
    var username:UITextField!
    
    var birthData:UITextField!
    
    var buttonProfile : UIButton?
    
    let lineLength:CGFloat = SCREEN_HEIGHT == 568 ? 150 : 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_profile"), forBarMetrics: .Default)
        chosenImage = UIImage()
        
        print("\(self.view.frame.width) and \(self.view.frame.height)")
        
        scrollView = UIScrollView(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64))
//        self.scrollView?.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+SCREEN_HEIGHT/16)
        scrollView!.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*1.5)
        
        //let scrowViewWidth = SCREEN_WIDTH
        //let scrowViewHeight = SCREEN_HEIGHT
        
        // init buttons
        let button = initButton(posX: SCREEN_WIDTH/2, posY: SCREEN_HEIGHT*1.5 - 50, btnWidth: 430/2, btnHeight: 75/2, imageName: "btn_done", targetAction: "toRadarPage")
        buttonProfile = initButton(posX: SCREEN_WIDTH/2, posY: 40, btnWidth: 140/3*2, btnHeight: 140/3*2, imageName: "user_pic_radar_140", targetAction: "toImagePicker")
        let marginX:CGFloat = 35
        // init labels
        let basicInfoLabel = initLabel(posX: 15, posY: SCREEN_HEIGHT*2/12, labelWidth: 100, labelHeight: 100, labelText: "Basic Info")
        let userNameLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*3/12, labelWidth: 100, labelHeight: 100, labelText: "Username")
        let textX = CGRectGetMaxX(userNameLabel.frame) + 20
        username = UITextField(frame: CGRectMake(textX,SCREEN_HEIGHT*3/12+40, lineLength, 20))
        username.textColor = UIColor.whiteColor()
        username.font = UIFont(name: FONTNAME_NORMAL, size: 15)
        let userLine = UIView(frame: CGRectMake(textX, CGRectGetMaxY(username.frame)+2, lineLength, 1))
        userLine.backgroundColor = UIColor.whiteColor()
        let dateOfBirthLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*4/12, labelWidth: 100, labelHeight: 100, labelText: "Date of Birth*")
        birthData = UITextField(frame: CGRectMake(textX, SCREEN_HEIGHT*4/12+40, lineLength, 20))
        birthData.textColor = UIColor.whiteColor()
        birthData.font = UIFont(name: FONTNAME_NORMAL, size: 15)
        let picker = UIDatePicker()
        picker.datePickerMode = .Date
        picker.addTarget(self, action: "dataDidChange:", forControlEvents: .ValueChanged)
        birthData.inputView = picker
        let accessoryView = UIToolbar(frame: CGRectMake(0, 0, SCREEN_WIDTH, 35))
        let doneBtn = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneClicked")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        accessoryView.setItems([space,doneBtn], animated: true)
        birthData.inputAccessoryView = accessoryView
        let birthLine = UIView(frame: CGRectMake(textX, CGRectGetMaxY(birthData.frame)+2, lineLength, 1))
        birthLine.backgroundColor = UIColor.whiteColor()
        let sexLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*5/12, labelWidth: 200, labelHeight: 100, labelText: "Sex*")
        let marriageLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*6/12, labelWidth: 200, labelHeight: 100, labelText: "Marriage")
        let emailLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*7/12, labelWidth: 200, labelHeight: 100, labelText: "Email")
        let hobbyLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*8/12, labelWidth: 200, labelHeight: 100, labelText: "Hobby")
        let moreDetailLabel = initLabel(posX: 15, posY: SCREEN_HEIGHT*9/12, labelWidth: 200, labelHeight: 100, labelText: "More Details")
        let statusLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*10/12, labelWidth: 200, labelHeight: 100, labelText: "Status")
        let InnerLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*12/12, labelWidth: 200, labelHeight: 100, labelText: "Inner")
        let OuterLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*13/12, labelWidth: 200, labelHeight: 100, labelText: "Outer")
        let EnergyLabel = initLabel(posX: marginX, posY: SCREEN_HEIGHT*14/12, labelWidth: 200, labelHeight: 100, labelText: "Energy")
        
        
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
        self.scrollView!.addSubview(username)
        self.scrollView!.addSubview(userLine)
        self.scrollView!.addSubview(birthData)
        self.scrollView!.addSubview(birthLine)
        
        
        self.view.addSubview(self.scrollView!)
        //self.scrollView.
        
        // Do any additional setup after loading the view.
        
        /*----------- ELCImagePicker Edition -----------*/
        
        
        
        
    }
    func doneClicked(){
        birthData.resignFirstResponder()
    }
    
    func dataDidChange(sender:UIDatePicker){
        birthData.text = sender.date.description
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
        resultLabel.font = UIFont(name: FONTNAME_BOLD, size: 16)
        resultLabel.textColor = UIColor(red: 255.0/255.0, green: 90.0/255.0, blue: 85.0/255.0, alpha: 1.0) //ff5a55
        resultLabel.numberOfLines = 1;
        return resultLabel
    }
    func initTextFiled(posX posX:CGFloat, posY: CGFloat, width: CGFloat, height: CGFloat)->UITextField{
        let resultTextField = UITextField(frame: CGRectMake(posX, posY, width, height))
        resultTextField.font = UIFont(name: FONTNAME_NORMAL, size: 15)
        return resultTextField
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
