//
//  LoginPinController.swift
//  Ten
//
//  Created by gt on 15/11/1.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit
import AFNetworking

class LoginPinController: UIViewController,UITextFieldDelegate {
    var loginBtn:UIButton!
    var emailAddr:String?
    @IBOutlet weak var pinText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //loginBtn
        let titleView = UIView(frame: CGRectMake(0,0,SCREEN_WIDTH,63))
        self.view.addSubview(titleView)
        let titleLabel = UILabel(frame:CGRectMake(0,20,SCREEN_WIDTH,43))
        titleLabel.text = "PIN"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: FONTNAME_NORMAL, size: 20)
        titleLabel.textAlignment = .Center
        titleView.addSubview(titleLabel)
        loginBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH-80,20,80,43))
        loginBtn.setTitle("登录", forState: .Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        loginBtn.addTarget(self, action: "loginClick", forControlEvents: .TouchUpInside)
        pinText.backgroundColor = UIColor.blackColor()
        pinText.textColor = UIColor.whiteColor()
        pinText.delegate = self
        pinText.returnKeyType = .Done
        let splitLine = UIView(frame: CGRectMake(0,63,SCREEN_WIDTH,1))
        splitLine.backgroundColor = UIColor.whiteColor()
        splitLine.alpha = 0.7
        self.view.addSubview(splitLine)
        self.view.addSubview(loginBtn)
        self.view.bringSubviewToFront(pinText)
        self.view.backgroundColor = BG_COLOR
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func loginClick(){
        
        let manager = AFHTTPRequestOperationManager()
        let timeStamp = Tools.getNormalTime(NSDate())
        
//        let stringHash = "\(emailAddr!)\(pinText.text!)\(UUID)\(timeStamp)\(deviceToken!)\(COMPANYCODE)"
        let stringHash = "281340731@qq.com123456\(timeStamp)\(UUID)\(DEVICETOKEN!)\(COMPANYCODE)"
        let stringHashPrint = "281340731@qq.com|123456|\(timeStamp)|\(UUID)|\(DEVICETOKEN!)|\(COMPANYCODE)"
        print(stringHashPrint)
        let hashResult = stringHash.sha256()
        print("hashresult"+hashResult)
        
        let url:NSString = LoginUrl+"?userID=281340731@qq.com&userPWD=123456&lastLogin=\(timeStamp)&DeviceUUID=\(UUID)&DeviceToken=\(DEVICETOKEN!)&HashValue=\(hashResult)"
        let urlNew = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        /*
        [15/10/27 上午9:33:59] Yumen Tsao: email
        [15/10/27 上午9:34:06] Yumen Tsao: pwd
        [15/10/27 上午9:34:11] Yumen Tsao: UUID
        [15/10/27 上午9:34:17] Yumen Tsao: Device Token
        [15/10/27 上午9:36:16] Yumen Tsao: timestamp
        [15/10/27 上午9:36:43] Yumen Tsao: company code
        [15/10/27 上午9:37:17] Yumen Tsao: sha-256
        */
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.GET( urlNew!,
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print(responseObject)
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let nVC = storyBoard.instantiateViewControllerWithIdentifier("NavController")
                    self.presentViewController(nVC, animated: true, completion: { () -> Void in
                    })
                })
            },
            failure: { (operation,error) in
                print("Error: " + error.localizedDescription)
                let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                print(NSString(data: data, encoding: NSUTF8StringEncoding))
                
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
