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
    
    var mobileBounds: CGRect?

    override init(){
        
        super.init()
        
        self.mobileBounds = CGRect()
        
        // more here
        
    }
    
    func gettingMobileViewBounds(bounds: CGRect){
        self.mobileBounds = bounds;
        print("mobile size is stored  in shared class");
    }

}

let sharedMobileInformation = MobileInfo()

