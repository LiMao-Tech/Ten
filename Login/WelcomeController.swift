//
//  WelcomeController.swift
//  Ten
//
//  Created by gt on 15/11/1.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var signupEmail: UITextField!
    
    var splitView:UIView!
    var submitBtn:UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BG_COLOR
        loginEmail.textColor = UIColor.whiteColor()
        loginEmail.backgroundColor = UIColor.blackColor()
        signupEmail.textColor = UIColor.whiteColor()
        signupEmail.backgroundColor = UIColor.blackColor()
        signupEmail.delegate = self
        loginEmail.delegate = self
        loginEmail.returnKeyType = .Done
        signupEmail.returnKeyType = .Done
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
        line0.alpha = 0.7
        line1.alpha = 0.7

        submitBtn = UIButton(frame: CGRectMake(SCREEN_WIDTH-80,20,80,44))
        submitBtn.setTitle("提交", forState: .Normal)
        submitBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        submitBtn.addTarget(self, action: "submitClick", forControlEvents: .TouchUpInside)
        let splitLine = UIView(frame: CGRectMake(0,64,SCREEN_WIDTH,1))
        splitLine.backgroundColor = UIColor.whiteColor()
        splitLine.alpha = 0.7
        self.view.addSubview(splitLine)
        self.view.addSubview(splitView)
        self.view.addSubview(submitBtn)
        splitView.addSubview(line0)
        splitView.addSubview(line1)
        splitView.addSubview(orLabel)
        
    }
    
    func doneClicked(){
        self.view.endEditing(true)
    }

    
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        let trans = textField.frame.origin.y - 300
//        if(trans<0){
//            self.view.transform = CGAffineTransformMakeTranslation(0, trans)
//        }
//        return true
//    }
//    
//    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
//        self.view.transform = CGAffineTransformMakeTranslation(0, 0)
//        return true
//    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func submitClick() {
//        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        let nVC = storyBoard.instantiateViewControllerWithIdentifier("NavController")
//        self.presentViewController(nVC, animated: true, completion: { () -> Void in
//        })
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
