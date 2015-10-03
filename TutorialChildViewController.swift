//
//  TutorialChildViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 10/2/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

class TutorialChildViewController: UIViewController {

    var pageIndex : Int = 0
    var titleText : String = ""
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: imageFile)!)
        
        let label = UILabel(frame: CGRectMake(0, 0, view.frame.width, 200))
        label.textColor = UIColor.whiteColor()
        label.text = titleText
        label.textAlignment = .Center
        view.addSubview(label)
        
        if(pageIndex == 4){
            let button = UIButton()
            button.frame = CGRectMake(0, 0, 125, 45)
            button.center = CGPointMake(view.frame.width - 100, view.frame.height - 100)
            button.setImage(UIImage(named: "btn_gotIt"), forState: UIControlState.Normal)
            button.addTarget(self, action: "toProfilePage", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toProfilePage(){
    
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController?.navigationBar.hidden = true
        let pVC = ProfileViewController()
        self.navigationController?.pushViewController(pVC, animated: true)
        
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
