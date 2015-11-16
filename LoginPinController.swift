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
        // Do any additional setup after loading the view.
    }
    
    func loginClick(){
        let loginURL = "http://limaoten.azurewebsites.net/api/tenlogins"
        let manager = AFHTTPRequestOperationManager()
        let timeStamp = NSDate().description
        let stringHash = "\(emailAddr!)\(pinText.text!)\(UUID)\(timeStamp)\(deviceToken)\(COMPANYCODE)"
        let hashResult = stringHash.sha256()
        let parameters = ["userID":emailAddr!,"userPWD":pinText.text!,"lastLogin":timeStamp,"DeviceUUID":UUID,"DeviceToken":deviceToken as! String,"HashValue":hashResult]
        
        /*[15/10/27 上午9:33:59] Yumen Tsao: email
        [15/10/27 上午9:34:06] Yumen Tsao: pwd
        [15/10/27 上午9:34:11] Yumen Tsao: UUID
        [15/10/27 上午9:34:17] Yumen Tsao: Device Token
        [15/10/27 上午9:36:16] Yumen Tsao: timestamp
        [15/10/27 上午9:36:43] Yumen Tsao: company code
        [15/10/27 上午9:37:17] Yumen Tsao: sha-256*/
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        manager.POST( loginURL,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                print("the respond object is: ")
                print( operation.responseData )
                let str = NSString(data: responseObject! as! NSData, encoding: NSUTF8StringEncoding)
                print(str);
                
            },
            failure: { (operation,error) in
                print("Error: " + error.localizedDescription)
                let data = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as! NSData
                print(NSString(data: data, encoding: NSUTF8StringEncoding))
        })
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_pin"), forBarMetrics: .Default)
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
