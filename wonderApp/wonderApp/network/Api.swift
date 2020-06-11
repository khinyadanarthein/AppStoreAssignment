//
//  Api.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Alamofire

protocol Api {
    
    func getAllWonderList(
    success: @escaping(WonderResponse) -> Void,
    fail: @escaping(String) -> Void)
}
