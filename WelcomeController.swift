//
//  WelcomeController.swift
//  Ten
//
//  Created by gt on 15/11/1.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var signupEmail: UITextField!
    @IBAction func submitClicked() {
        if(!loginEmail.text!.isEmpty){
            let pVC = LoginPinController()
            pVC.emailAddr = loginEmail.text
            self.navigationController?.pushViewController(pVC, animated: true)
        }
        else if(!signupEmail.text!.isEmpty){
            let sVC = SignUpController()
            sVC.emailAddr = signupEmail.text
            self.navigationController?.pushViewController(sVC, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmail.textColor = UIColor.whiteColor()
        loginEmail.backgroundColor = GTgrayColor
        signupEmail.textColor = UIColor.whiteColor()
        signupEmail.backgroundColor = GTgrayColor
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:"navBar_welcome"), forBarMetrics: .Default)
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
