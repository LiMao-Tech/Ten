//
//  ProfileViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/2/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        print("\(SCREEN_WIDTH - 100) and \(SCREEN_HEIGHT - 100)")
        
        let button = UIButton()
        button.frame = CGRectMake(0, 0, 125, 45)
        button.center = CGPointMake(SCREEN_WIDTH - 100, SCREEN_HEIGHT - 50)
        button.setImage(UIImage(named: "btn_gotIt"), forState: UIControlState.Normal)
        button.addTarget(self, action: "toRadarPage", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func toRadarPage(){
        
        //TODO: will need to add user data into this area
        self.navigationController?.popToRootViewControllerAnimated(true)
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
