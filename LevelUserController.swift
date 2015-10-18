//
//  LevelUserController.swift
//  Ten
//
//  Created by gt on 15/10/12.
//  Copyright © 2015年 LiMao Tech. All rights reserved.
//

import UIKit

class LevelUserController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var userList:UITableView!
    var level = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = level
        userList = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64))
        userList.dataSource = self
        userList.delegate = self
        userList.separatorStyle = .None
        userList.backgroundColor = UIColor.blackColor()
        self.view.addSubview(userList)
        // Do any additionalsetup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = userList.dequeueReusableCellWithIdentifier("RALUserCell") as? RandomAndLevelUserCell
        if(cell == nil){
            cell = RandomAndLevelUserCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "RALUserCell")
        }
        cell?.RALuser = RandomAndLevelUser()
        return cell!
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
