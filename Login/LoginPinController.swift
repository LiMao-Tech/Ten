//
//  LoginPinController.swift
//  Ten
//
//  Created by gt on 15/11/1.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit
import AFNetworking

class LoginPinController: UIViewController {
    var loginBtn:UIButton!
    var emailAddr:String?
    @IBOutlet weak var pinText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bg = UIImageView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        bg.image = UIImage(named: "bg_welcome")
        
        //loginBtn
        let x = (SCREEN_WIDTH-215)/2
        let y = SCREEN_HEIGHT-190
        loginBtn = UIButton(frame: CGRectMake(x,y,215,37))
        loginBtn.setImage(UIImage(named: "btn_login"), forState: .Normal)
        loginBtn.addTarget(self, action: "loginClick", forControlEvents: .TouchUpInside)
        pinText.backgroundColor = GTgrayColor
        pinText.textColor = UIColor.whiteColor()
        
        self.view.addSubview(bg)
        self.view.addSubview(loginBtn)
        
        self.view.bringSubviewToFront(pinText)
        
        // Do any additional setup after loading the view.
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
