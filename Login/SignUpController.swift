//
//  SignUpController.swift
//  Ten
//
//  Created by gt on 15/11/2.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

let GTgrayColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)

import UIKit
import AFNetworking
import CryptoSwift

class SignUpController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var newPin: UITextField!
    @IBOutlet weak var newPinRe: UITextField!
    var emailAddr:String?
    var nextBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleView = UIView(frame: CGRectMake(0,0,SCREEN_WIDTH,63))
        self.view.addSubview(titleView)
        let titleLabel = UILabel(frame:CGRectMake(0,20,SCREEN_WIDTH,43))
        titleLabel.text = "设置PIN"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: FONTNAME_NORMAL, size: 20)
        titleLabel.textAlignment = .Center
        titleView.addSubview(titleLabel)
        newPin.backgroundColor = UIColor.blackColor()
        newPinRe.backgroundColor = UIColor.blackColor()
        newPin.returnKeyType = .Done
        newPinRe.returnKeyType = .Done
        newPin.textColor = UIColor.whiteColor()
        newPinRe.textColor = UIColor.whiteColor()
        newPin.delegate = self
        newPinRe.delegate = self
        //nextBtn
        nextBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH-80,20,80,44))
        nextBtn.addTarget(self, action: "nextClick", forControlEvents: .TouchUpInside)
        nextBtn.setTitle("下一步", forState: .Normal)
        nextBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        let splitLine = UIView(frame: CGRectMake(0,63,SCREEN_WIDTH,1))
        splitLine.backgroundColor = UIColor.whiteColor()
        splitLine.alpha = 0.7
        self.view.addSubview(splitLine)
        self.view.addSubview(nextBtn)
        self.view.backgroundColor = BG_COLOR
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func nextClick(){
        if(newPin.text == newPinRe.text){
            signupPost()
        }
    }
    func doneClicked(){
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_pin"), forBarMetrics: .Default)
    }
    
    func signupPost(){
        
        self.navigationController?.navigationBar.hidden = false
        let rpVC = RegistProfileViewController()
        rpVC.email = self.emailAddr!
        rpVC.password = self.newPinRe.text!
        self.presentViewController(rpVC, animated: true, completion: { () -> Void in
            
        })
//        let manager = AFHTTPRequestOperationManager()
//        let timeStamp = NSDate().description
//        let stringHash = "\(emailAddr!)\(newPinRe.text!)\(UUID)\(timeStamp)\(deviceToken)\(COMPANYCODE)"
//        let hashResult = stringHash.sha256()
//        let parameters = ["userID":emailAddr!,"userPWD":newPinRe.text!,"lastLogin":timeStamp,"DeviceUUID":UUID,"DeviceToken":deviceToken as! String,"HashValue":hashResult]

//        manager.requestSerializer = AFJSONRequestSerializer()
//        manager.responseSerializer = AFJSONResponseSerializer()
//        
//        manager.POST( loginUrl,
//            parameters: parameters,
//            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
//                print(responseObject)
//               
//                })
//            },
//            failure: { (operation,error) in
//                print("Error: " + error.localizedDescription)
//                let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
//                print(NSString(data: data, encoding: NSUTF8StringEncoding))
//        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
