//
//  FMDBManager.swift
//  Ten
//
//  Created by Yifang Zhang on 10/9/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import UIKit

let sharedDatabase = FMDBManager()

class FMDBManager: NSObject {
    
    static let sharedInstance = FMDBManager()
    
    let DATABASE_FILE_NAME = "TenDB.sql"
    var fmdbQueue : FMDatabaseQueue?
    
    
    override init(){
        
        super.init()
        
        let filePath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let dbfile = "/" + DATABASE_FILE_NAME;
        let dbFilePath = filePath.stringByAppendingString(dbfile)
        
        fmdbQueue = FMDatabaseQueue.init(path: dbFilePath)
        
        
        
    }
    
    
    func createUserTable() -> Bool{
    
        var flag = true
        
        fmdbQueue?.inDatabase(){
            db in
            
            // creating the table for TenUsers -- 0 is male, 1 is female
            let sqlStatement = "CREATE TABLE IF NOT EXISTS TenUsers(" +
                
                "user_index int IDENTITY(1,1) PRIMARY KEY, " +
                
                "user_id nvarchar(32) NOT NULL UNIQUE, " +
                
                "user_name nvarchar(32) NOT NULL, " +
                
                "gender tinyint NOT NULL, " +
                
                "birth_date date NOT NULL, " +
                
                "joined_date date NOT NULL, " +
                
                "last_login_datetime datetime NOT NULL, " +
                
                "p_coin money NOT NULL, " +
                
                "outer_score int NOT NULL, " +
                
                "inner_score int NOT NULL, " +
                
                "energy int NOT NULL, " +
                
                "quote nvarchar(128), " +
                
                "latitude float(53), " +
                
                "longitude float(53) " +
                
            ");"
            
            let createDatabaseFlag = db.executeUpdate(sqlStatement, withArgumentsInArray: nil)
            
            if (!createDatabaseFlag) {
                print("table create failure: \(db.lastErrorMessage())")
                flag = false
            }
            else {
                print("table creation is successful")
                flag = true
            }
            
        }// end of databse Ten User Table Creation
    
        return flag
    
    }
    
    func insertUser(userIndex user_index: Int, user_id: String, user_name: String, gender:Int, birth_date: String, joined_date: String, last_login_datetime: String, p_coin: String, outer_score: Int, inner_score: Int, energy: Int, quote: String, latitude: Float, longitude: Float ) -> Bool{
    
        
        return true
    }
    
    func readUser(readUserWithID user_id: String){
    
    
        return
    
    }
    
    func readUser(readUserwithIndex: Int){
    
        return
    
    }
    
    func deleteUser(deleteUserWithID user_id: String){
    
        return
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


