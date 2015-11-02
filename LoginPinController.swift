//
//  LoginPinController.swift
//  Ten
//
//  Created by gt on 15/11/1.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit


class LoginPinController: UIViewController {
    var loginBtn:UIButton!
    var emailAddr:String?
    @IBOutlet weak var pinText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_pin"), forBarMetrics: .Default)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_welcome")!)
        //loginBtn
        let x = (SCREEN_WIDTH-215)/2
        let y = SCREEN_HEIGHT-190
        loginBtn = UIButton(frame: CGRectMake(x,y,215,37))
        loginBtn.setImage(UIImage(named: "btn_login"), forState: .Normal)
        loginBtn.addTarget(self, action: "loginClick", forControlEvents: .TouchUpInside)
        pinText.backgroundColor = GTgrayColor
        pinText.textColor = UIColor.whiteColor()
        self.view.addSubview(loginBtn)
        // Do any additional setup after loading the view.
    }
    
    func loginClick(){
        print("loginClick")
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
