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
    @IBOutlet weak var welcomeBGImageView: UIImageView!
    
    var splitView:UIView!
    var submitBtn:UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.textColor = UIColor.whiteColor()
        loginEmail.backgroundColor = GTgrayColor
        signupEmail.textColor = UIColor.whiteColor()
        signupEmail.backgroundColor = GTgrayColor
        
        //splitView
        splitView = UIView(frame: CGRectMake(0,210,SCREEN_WIDTH,20))
        let len = (SCREEN_WIDTH-60-50-20)/2
        let line0 = UIView(frame: CGRectMake(30,10,len,1))
        line0.backgroundColor = UIColor.whiteColor()
        let orLabel = UILabel(frame: CGRectMake(40+len,0,50,20))
        orLabel.text = "or"
        orLabel.textAlignment = .Center
        orLabel.font = UIFont(name: FONTNAME_NORMAL, size: 16)
        orLabel.textColor = UIColor.whiteColor()
        let line1 = UIView(frame: CGRectMake(100+len,10,len,1))
        line1.backgroundColor = UIColor.whiteColor()
        let x = (SCREEN_WIDTH-215)/2
        let y = SCREEN_HEIGHT-80
        submitBtn = UIButton(frame: CGRectMake(x,y,215,37))
        submitBtn.setImage(UIImage(named: "btn_submit"), forState: .Normal)
        submitBtn.addTarget(self, action: "submitClick", forControlEvents: .TouchUpInside)
        self.view.addSubview(splitView)
        self.view.addSubview(submitBtn)
        splitView.addSubview(line0)
        splitView.addSubview(line1)
        splitView.addSubview(orLabel)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.welcomeBGImageView.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard () {
        self.loginEmail.resignFirstResponder()
        self.signupEmail.resignFirstResponder()
    }
    
    func submitClick() {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let nVC = storyBoard.instantiateViewControllerWithIdentifier("NavController")
        self.presentViewController(nVC, animated: true, completion: { () -> Void in
        })
        if(!loginEmail.text!.isEmpty){
            let pVC = LoginPinController()
            pVC.emailAddr = loginEmail.text
            self.presentViewController(pVC, animated: true, completion: { () -> Void in
            })
        }
        else if(!signupEmail.text!.isEmpty){
            let sVC = SignUpController()
            sVC.emailAddr = signupEmail.text
            self.presentViewController(sVC, animated: true, completion: { () -> Void in
            })
        }
    }
    
    // MARK: - Navigation

}
