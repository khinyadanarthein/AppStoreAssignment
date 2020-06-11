//
//  SQLiteHelper.swift
//  FMDBTest
//
//  Created by Khin Yadanar Thein on 16/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import FMDB

class SQLiteHelper {
    
    static let shared = SQLiteHelper()
    
    // create db name
    let databaseFileName = "person.sqlite"
    
    // create path of db
    var pathToDatabase : String!
    
    var database: FMDatabase!
    
    private init() {
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        
        pathToDatabase = documentsDirectory.appending("\(databaseFileName)")
    }
    
    func createDatabase() -> Bool {
        let created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase){
            database = FMDatabase(path: pathToDatabase!)
            
            if database != nil {
                print("db is exit")
                
                if database.open() {
                    createPersonTable()
                    database.close()
                } else {
                    print("Could not open the database.")
                }
            }
        }
        
        return created
    }
    
    // create table
    func createPersonTable() {
        let createSingerTableQuery = "create table name (id integer primary key not null, name text not null)"
        
        performCreateTableExec(query: createSingerTableQuery)
    }
    
    // create table query execution
    func performCreateTableExec(query : String) {
        
        do {
            try database.executeUpdate(query, values: nil)
            print("Table is created!.")
            
        } catch {
            print("Could not create table.")
            print(error.localizedDescription)
        }
    }
    
    // Check DB is open or not
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        if database != nil {
            if database.open() {
                return true
            }
        }
        return false
    }
    
    // Insert name to Table
    func insertPerson(name : String) {
        if openDatabase() {
            let taskInsertQuery = "insert into name ('name') values ('\(name)')"
            
            performInsertExec(query: taskInsertQuery)
        }
    }
    
    // Insert Query execution
    func performInsertExec(query : String) {
        
        if !database.executeStatements(query) {
            print("Failed to insert initial data into the database.")
            print(database.lastError(), database.lastErrorMessage())
        }
        print("Success to insert initial data into the database.")
        
        database.close()
    }
    
    func getPeople() -> [Person] {
        
        var people = [Person]()
        
        if openDatabase() {
            let query = "select * from name"
            
            do {
                let results = try database.executeQuery(query, values: nil)
                
                while results.next() {
                    
                    let person = Person()
                    person.name = results.string(forColumn: "name") ?? "Unknown"
                    person.id = Int(results.int(forColumn: "id"))
                    
                    people.append(person)
                }
            }catch {
                print(error.localizedDescription)
            }
            database.close()
        }
        return people
    }
    
    func deletePerson(id : Int) {
        
        if openDatabase() {
            let query = "DELETE FROM name WHERE id =?"
            
            do {
                try database.executeUpdate(query, values: [id])
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
