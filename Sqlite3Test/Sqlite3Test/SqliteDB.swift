//
//  SqliteDB.swift
//  Sqlite3Test
//
//  Created by zhangpan on 15/11/11.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation

func getDomainDirPath() -> String {
    let array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    return array[0]
}

class SqliteDB: NSObject {

    var db: COpaquePointer = nil
    
    func openDatabase(dbName: String) -> Bool {
        
        let pathStr: String = getDomainDirPath() + dbName
        
        let success = sqlite3_open(pathStr, &db)
        if success != SQLITE_OK {
            print("Open Database Fail.")
            return false
        }
        
        print("Open Database Success")
        return true
    }
    
    func createTable() -> Bool {
        
    }
    
    func closeDatabase() {
        
    }
    
}
