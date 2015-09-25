//
//  ProfileViewController.swift
//  Ten
//
//  Created by Yifang Zhang on 9/19/15.
//  Copyright (c) 2015 LiMao Tech. All rights reserved.
//

import UIKit
import QuartzCore
import CoreLocation
import Foundation
import AFNetworking

class ProfileViewController: UIViewController {

    /* variables for radial menu */
    var addButton:UIImageView
    var tapView:UIView
    var radialMenu:RadialMenu!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let num = 5
    let addButtonSize: CGFloat = 20.0
    let menuRadius: CGFloat = 125.0
    let subMenuRadius: CGFloat = 15.0
    var didSetupConstraints = false
    
    let colors = [UIColor.blackColor(), UIColor.redColor(), UIColor.yellowColor(), UIColor.grayColor(), UIColor.greenColor()]
    /* end of variables for radial menu */
    
    required init(coder aDecoder: NSCoder) {
        
        addButton = UIImageView(image: UIImage(named: "plus"))
        tapView = UIView()
        sharedManager
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initRadialMenu()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_menu")!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //TODO: starting the RadiaMenu
    func initRadialMenu(){
        
        /* Setup radial menu */
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "pressedButton:")
        
        var subMenus: [RadialSubMenu] = []
        for i in 0..<num {
            subMenus.append(self.createSubMenu(i))
        }
        
        radialMenu = RadialMenu(menus: subMenus, radius: menuRadius)
        radialMenu.center = view.center
        radialMenu.openDelayStep = 0.05
        radialMenu.closeDelayStep = 0.00
        radialMenu.minAngle = 275
        radialMenu.maxAngle = 355
        radialMenu.activatedDelay = 0.5
        radialMenu.backgroundView.alpha = 0.0
        
        radialMenu.onClose = {
            for subMenu in self.radialMenu.subMenus {
                self.resetSubMenu(subMenu)
            }
        }
        
        radialMenu.onHighlight = { subMenu in
            self.highlightSubMenu(subMenu)
            
            
            let color = self.colorForSubMenu(subMenu).colorWithAlphaComponent(1.0)
            
            // TODO: Add nice color transition
            self.view.backgroundColor = color
        }
        
        radialMenu.onActivate = { subMenu in
            // did select subMenu
            let pos = subMenu.tag % self.colors.count
            
            println("selected: \(pos)")
            
            //TODO: add more pos to different pages
            
            if pos == 0 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("Profile") as! UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
                
                //self.performSegueWithIdentifier("ProfileToRadar", sender: self)
                //println("new method works")
                
            }
                
            else if pos == 1 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("Radar") as! UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
                
                //self.performSegueWithIdentifier("ProfileToRadar", sender: self)
                //println("new method works")
                
                
            }
                
            else if pos == 2 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("Chat") as! UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
                
            }
                
            else if pos == 3 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("Notification") as! UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
                
            }
                
            else if pos == 4 {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("Setting") as! UIViewController
                self.presentViewController(vc, animated: true, completion: nil)
            }
        }
        
        radialMenu.onUnhighlight = { subMenu in
            self.resetSubMenu(subMenu)
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
        radialMenu.onClose = {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
        view.addSubview(radialMenu)
        
        // Setup add button
        addButton.userInteractionEnabled = true
        addButton.alpha = 0.65
        view.addSubview(addButton)
        
        tapView.center = view.center
        tapView.addGestureRecognizer(longPress)
        view.addSubview(tapView)
        
        /* end of radial menu */
    }
    
    
    // FIXME: Consider moving this to the radial menu and making standard interaction types  that are configurable
    func pressedButton(gesture:UIGestureRecognizer) {
        switch(gesture.state) {
        case .Began:
            self.radialMenu.openAtPosition(self.addButton.center)
        case .Ended:
            self.radialMenu.close()
        case .Changed:
            self.radialMenu.moveAtPosition(gesture.locationInView(self.view))
        default:
            break
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if (!didSetupConstraints) {
            
            // FIXME: Any way to simplify this?
            addButton.autoAlignAxisToSuperviewAxis(.Baseline)
            //addButton.autoAlignAxisToSuperviewAxis(.Vertical)
            addButton.autoSetDimensionsToSize(CGSize(width: addButtonSize, height: addButtonSize))
            
            tapView.autoAlignAxisToSuperviewAxis(.Baseline)
            //tapView.autoAlignAxisToSuperviewAxis(.Vertical)
            tapView.autoSetDimensionsToSize(CGSize(width: addButtonSize*2, height: addButtonSize*2))
            
            didSetupConstraints = true
            
        }
    }
    
    // MARK - RadialSubMenu helpers
    
    func createSubMenu(i: Int) -> RadialSubMenu {
        let subMenu = RadialSubMenu(frame: CGRect(x: 0.0, y: 0.0, width: CGFloat(subMenuRadius*2), height: CGFloat(subMenuRadius*2)))
        subMenu.userInteractionEnabled = true
        subMenu.layer.cornerRadius = subMenuRadius
        subMenu.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.5).CGColor
        subMenu.layer.borderWidth = 1
        subMenu.tag = i
        resetSubMenu(subMenu)
        return subMenu
    }
    
    func colorForSubMenu(subMenu: RadialSubMenu) -> UIColor {
        let pos = subMenu.tag % colors.count
        return colors[pos] as UIColor!
    }
    
    func highlightSubMenu(subMenu: RadialSubMenu) {
        let color = colorForSubMenu(subMenu)
        subMenu.backgroundColor = color.colorWithAlphaComponent(1.0)
    }
    
    func resetSubMenu(subMenu: RadialSubMenu) {
        let color = colorForSubMenu(subMenu)
        subMenu.backgroundColor = color.colorWithAlphaComponent(0.75)
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
