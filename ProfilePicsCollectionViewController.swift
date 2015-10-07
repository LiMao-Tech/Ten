//
//  ProfilePicsCollectionViewController.swift
//  Ten
//
//  Created by Yumen Cao on 10/3/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

private let ProfileCellName = "ProfilePicsCollectionViewCell"
private let ProfileCellIdentifier = "ProfilePicCell"
private let HostName = "http://www.code-desire.com.tw"
private let ImageAddr = "http://www.code-desire.com.tw/LiMao/Barter/Images"


class ProfilePicsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let cellXib = UINib(nibName: ProfileCellName, bundle: nil)
        self.collectionView!.registerNib(cellXib, forCellWithReuseIdentifier: ProfileCellIdentifier)

        // configure collectionview
        self.collectionView!.backgroundColor = UIColor.darkGrayColor()
        self.collectionView!.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TOOL_BAR_HEIGHT)
        
        // create toolbar
        let toolbar = UIToolbar(frame: CGRectMake(0, SCREEN_HEIGHT-TOOL_BAR_HEIGHT, SCREEN_WIDTH, TOOL_BAR_HEIGHT))
        toolbar.backgroundColor = UIColor.darkGrayColor()
        toolbar.items = [UIBarButtonItem]()
        
        let optionItem = UIBarButtonItem(image: UIImage(named: "btn_tabBarIcon_option"), style: UIBarButtonItemStyle.Plain, target: self, action: "toolBarOption")
        let unlockItem = UIBarButtonItem(image: UIImage(named: "btn_tabBarIcon_unlock"), style: UIBarButtonItemStyle.Plain, target: self, action: "toolBarUnlock")
        let lockItem = UIBarButtonItem(image: UIImage(named: "btn_tabBarIcon_lock"), style: UIBarButtonItemStyle.Plain, target: self, action: "toolBarLock")
        let deleteItem = UIBarButtonItem(image: UIImage(named: "btn_tabBarIcon_delete"), style: UIBarButtonItemStyle.Plain, target: self, action: "toolBarDelete")
        
        // adjust insets
        let inset = UIEdgeInsetsMake(3, 0, 3, 0)
        optionItem.imageInsets = inset
        optionItem.width = 15
        unlockItem.imageInsets = inset
        unlockItem.width = 5
        lockItem.imageInsets = inset
        lockItem.width = 5
        deleteItem.imageInsets = inset
        deleteItem.width = 5
        
        // insert paddings between items
        let padding = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        padding.width = (SCREEN_WIDTH - 4*optionItem.width)/3
            
        toolbar.items!.append(optionItem)
        toolbar.items!.append(padding)
        toolbar.items!.append(unlockItem)
        toolbar.items!.append(padding)
        toolbar.items!.append(lockItem)
        toolbar.items!.append(padding)
        toolbar.items!.append(deleteItem)
        
        self.view.addSubview(toolbar)
        
        // init collection view data
        initData()
        self.collectionView!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() -> Void {
        // init the view
        

    }
    func toolBarOption() -> Void {
        print("Clicked option")
    }
    func toolBarUnlock() -> Void {
        print("Clicked unlock")

    }
    func toolBarLock() -> Void {
        print("Clicked lock")

    }
    func toolBarDelete() -> Void {
        print("Clicked delete")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items

        return 32
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ProfileCellIdentifier, forIndexPath: indexPath)
        // Configure the cell
        cell.backgroundColor = UIColor.whiteColor()
        
        // getDataFromUrl(<#T##urL: NSURL##NSURL#>, completion: <#T##((data: NSData?) -> Void)##((data: NSData?) -> Void)##(data: NSData?) -> Void#>)
    
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2
    }

    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSizeMake(SCREEN_WIDTH*2/3-1, SCREEN_WIDTH*2/3-1)

        }
        else {
            return CGSizeMake(SCREEN_WIDTH/3-1, SCREEN_WIDTH/3-1)

        }
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
}
