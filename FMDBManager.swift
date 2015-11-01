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
    
    func insertUser(userIndex user_index: Int, user_id: String, user_name: String, gender:Int, birth_date: NSDate, joined_date: NSDate, last_login_datetime: NSDate, p_coin: String, outer_score: Int, inner_score: Int, energy: Int, quote: String, latitude: Float, longitude: Float ) -> Bool{
    
        var flag = true
        
        // int transfer
        let userIndex = user_index.description
        let gender_Str = gender.description
        let outerScore = outer_score.description
        let innerScore = inner_score.description
        let energy_Str = energy.description
        let lat = latitude.description
        let lon = longitude.description
        
        // date transfer
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        let birthDate = dateFormatter.stringFromDate(birth_date)
        let joinedDate = dateFormatter.stringFromDate(joined_date)
        let lastLoginDatetime = dateFormatter.stringFromDate(last_login_datetime)
        
        //TODO: asking about what is the type of p_coin
        
        
        fmdbQueue?.inDatabase(){
            db in
            
            // creating the table for TenUsers -- 0 is male, 1 is female
            let sqlStatement = "INSERT INTO TenUsers" +
                
                " (user_index, user_id, user_name, gender, birth_date, joined_date, last_login_datetime, p_coin, outer_score, inner_score, energy, quote, latitude, longitude) " +
                
                "VALUES" +
            
                " (\(userIndex), '\(user_id)', '\(user_name)', \(gender_Str), \(birthDate), \(joinedDate), \(lastLoginDatetime), \(p_coin), \(outerScore), \(innerScore), \(energy_Str), '\(quote)', \(lat), \(lon) ); "
            
            //print("sql statement for insertion is: \n \(sqlStatement)")
            
            let createDatabaseFlag = db.executeUpdate(sqlStatement, withArgumentsInArray: nil)
            
            if (!createDatabaseFlag) {
                print("insert into table failure: \(db.lastErrorMessage())")
                flag = false
            }
            else {
                print("table insertion is successful")
                flag = true
            }
        }
        
        
        return flag
    }
    
    /*
    func readUserWithID(ID user_id: String) -> TenUser {
    
        // var cur_user = TenUser()
        
        fmdbQueue?.inDatabase(){
            db in
            
            // creating the table for TenUsers -- 0 is male, 1 is female
            let sqlStatement = "SELECT * FROM TenUsers"
            
            let rs = db.executeQuery(sqlStatement, withArgumentsInArray: nil)
            if(rs != nil){
                while rs.next() {
                    print(rs.resultDictionary())
                }
                
                
                //cur_user.initWithAllParameters(userIndex: <#T##Int#>, user_id: <#T##String#>, user_name: <#T##String#>, gender: <#T##Int#>, birth_date: <#T##NSDate#>, joined_date: <#T##NSDate#>, last_login_datetime: <#T##NSDate#>, p_coin: <#T##String#>, outer_score: <#T##Int#>, inner_score: <#T##Int#>, energy: <#T##Int#>, quote: <#T##String#>, latitude: <#T##Float#>, longitude: <#T##Float#>)
            }
            else{
                //cur_user = nil
            }
        }
        
        
        
//        return cur_user
    }
    */
    func readUserWithIndex(Index user_index: Int){
    
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


