//
//  MobileInfo.swift
//  Ten
//
//  Created by Yifang Zhang on 9/26/15.
//  Copyright (c) 2015 LiMao Tech. All rights reserved.
//

import Foundation
import UIKit

class MobileInfo: NSObject{


    static let sharedMobileInfo = MobileInfo()
    
    var mobileWidth: CGFloat?
    var mobileHeight: CGFloat?

    override init(){
        
        super.init()
        
        self.mobileHeight = 0.0
        self.mobileWidth = 0.0
        
        // more here
        
    }
    
    func gettingMobileHeightAndWidth(mobileH: CGFloat, andWidth mobileW: CGFloat){
        self.mobileHeight = mobileH;
        self.mobileWidth = mobileW;
        println("mobile size is stored  in shared class");
    }

}

let sharedMobileInformation = MobileInfo()

