//
//  SQLiteDataModel.swift
//  FMDBTest
//
//  Created by Khin Yadanar Thein on 16/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class SQLiteDataModel: Model {
    
    static let shared = SQLiteDataModel()
    
    private init() {}
    
    private let dbHelper = SQLiteHelper.shared
    
    func getPeople() -> [Person] {
        dbHelper.getPeople()
    }
    
    func addName(name: String) {
        dbHelper.insertPerson(name: name)
    }
    
    func deleteName(id: Int) {
        dbHelper.deletePerson(id: id)
    }
    
    
}
