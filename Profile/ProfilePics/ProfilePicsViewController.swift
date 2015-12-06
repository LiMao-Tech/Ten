//
//  ProfilePicsViewController.swift
//  Ten
//
//  Created by Yumen Cao on 11/29/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit



class ProfilePicsViewController: UIViewController, LMCollectionViewLayoutDelegate {

    private var isAnimating : Bool = false
    private var num : Int = 0
    
    private let numbers : NSMutableArray = NSMutableArray()
    private let numberWidths : NSMutableArray = NSMutableArray()
    private let numberHeights : NSMutableArray = NSMutableArray()
    
    private let layout : LMCollectionViewLayout = LMCollectionViewLayout()
    
    private var profilePicsCollectionView : UICollectionView
    
     init() {
        self.init()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.magnifyCellAtIndexPath(indexPath)
    }
    
    // To specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // To specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    // To specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        
    }
    
}
