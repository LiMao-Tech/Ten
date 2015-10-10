//
//  FMDBManager.swift
//  Ten
//
//  Created by Yifang Zhang on 10/9/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit


class FMDBManager: NSObject {
    
    
    let fmdbManager = FMDatabase()
    
    
    override init(){
        
        super.init()
        
        
        
        
    }
    /*
    
    NSLog(@"Checking for database file");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *dbPath = [self getDBPath];
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ihaikudb.sql"];
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    NSLog(@"If needed, bundled default DB is at: %@",defaultDBPath);
    
    if(!success) {
    NSLog(@"Database didn't exist... Copying default from resource dir");
    success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
    
    if (!success)
    NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    } else {
    NSLog(@"Database must have existed at the following path: %@", dbPath);
    }
    NSLog(@"Done checking for db file");
    }
    
    */
    

}
