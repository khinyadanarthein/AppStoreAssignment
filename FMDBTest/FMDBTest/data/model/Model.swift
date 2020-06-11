//
//  Model.swift
//  FMDBTest
//
//  Created by Khin Yadanar Thein on 16/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

protocol Model {
    func getPeople() -> [Person]
    func addName(name : String)
    func deleteName(id : Int)
}
