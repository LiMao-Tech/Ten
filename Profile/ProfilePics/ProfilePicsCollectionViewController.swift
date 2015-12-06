//
//  ProfilePicsCollectionViewController.swift
//  Ten
//
//  Created by Yumen Cao on 12/5/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit


private let ProfilePicCellName = "ProfilePicsCollectionViewCell"
private let ProfilePicCellIdentifier = "ProfilePicCell"
private let HostName = "http://www.code-desire.com.tw"
private let ImageAddr = "http://www.code-desire.com.tw/LiMao/Barter/Images"



enum CELLSIZE : Int {
    case STD = 1, L
}

class ProfilePicsCollectionViewController: UICollectionViewController, LMCollectionViewLayoutDelegate {
    
    private var isAnimating : Bool = false
    private var num : Int = 0
    
    private let numbers : NSMutableArray = NSMutableArray()
    private let numberWidths : NSMutableArray = NSMutableArray()
    private let numberHeights : NSMutableArray = NSMutableArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.collectionView)
        
        // Register cell classes
        let cellXib = UINib(nibName: ProfilePicCellName, bundle: nil)
        self.collectionView?.registerNib(cellXib, forCellWithReuseIdentifier: ProfilePicCellIdentifier)
        
        // Init Data
        self.dataInit()
        
        // Configs
        self.collectionView?.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        self.collectionView?.backgroundColor = UIColor.darkGrayColor()

        self.collectionView?.reloadData()
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numbers.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ProfilePicCellIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
        cell.backgroundColor = colorForNumber(indexPath.row)
        print("Dequed Cell")
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
        
        return CGSizeMake(SCREEN_WIDTH/3-1, SCREEN_WIDTH/3-1)
        
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, blockSizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        if indexPath.row > self.numbers.count {
            print("None existing Index Path!")
        }
        
        let width = self.numberWidths .objectAtIndex(indexPath.row).doubleValue
        let height = self.numberHeights .objectAtIndex(indexPath.row).doubleValue
        
        return CGSize(width: width, height: height)
    }
    
    
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetsForItemAtIndexPath indexPath: NSIndexPath!) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.magnifyCellAtIndexPath(indexPath)
    }
    
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }

    
    // Helpers
    
    func dataInit() -> Void {
        
        for i in 1...15 {
            self.numbers.addObject(i as AnyObject)
            self.numberWidths.addObject(self.randomLength() as AnyObject)
            self.numberHeights.addObject(self.randomLength() as AnyObject)
        }
    }
    
    func addIndexPath(indexPath : NSIndexPath) -> Void {
        if indexPath.row > self.numbers.count {
            return
        }
        if self.isAnimating {
            return
        }
        self.isAnimating = true
        
        self.collectionView?.performBatchUpdates(
            {() in
                let index = indexPath.row
                
                self.numbers.insertObject(++self.num, atIndex: index)
                self.numberWidths.insertObject(CELLSIZE.STD as! AnyObject, atIndex: index)
                self.numberHeights.insertObject(CELLSIZE.STD as! AnyObject, atIndex: index)
                
                self.collectionView?.insertItemsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)])
                
            }, completion: {(done : Bool) in
                self.isAnimating = false
            }
        )
        
    }
    
    func magnifyCellAtIndexPath(indexPath : NSIndexPath) -> Void {
        
        if (self.numbers.count == 0 || indexPath.row > self.numbers.count) {
            return
        }
        
        if (isAnimating) {
            return
        }
        isAnimating = true
        
        self.collectionView?.performBatchUpdates(
            {() in
                let index = indexPath.row
                
                // self.numbers.removeObjectAtIndex(index)
                self.numberWidths.removeObjectAtIndex(index)
                self.numberHeights.removeObjectAtIndex(index)
                
                self.collectionView?.deleteItemsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)])
                
                // self.numbers.insertObject(++self.num, atIndex: index)
                self.numberWidths.insertObject(CELLSIZE.L as! AnyObject, atIndex: index)
                self.numberHeights.insertObject(CELLSIZE.L as! AnyObject, atIndex: index)
                
                self.collectionView?.insertItemsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)])
                
                /*
                let width = self.numberWidths[index] as! Int * 2
                let height = self.numberHeights[index] as! Int * 2
                
                self.numberWidths.replaceObjectAtIndex(index, withObject: width)
                self.numberHeights.replaceObjectAtIndex(index, withObject: height)
                */
                
            }, completion: {(done : Bool) in
                self.isAnimating = false
            }
        )
    }
    
    func colorForNumber(num : NSNumber) -> UIColor {
        let numerator : CGFloat = CGFloat((19 * num.integerValue) % 255)
        let hueValue : CGFloat = numerator/255.0
        return UIColor(hue: hueValue, saturation: 0.5, brightness: 1.0, alpha: 0.8)
    }
    
    func randomLength() -> Int {
        return 1
    }
}
