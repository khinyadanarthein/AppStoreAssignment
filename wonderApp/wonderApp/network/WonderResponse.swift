//
//  WonderResponse.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class WonderResponse: Codable {
    let wonders: [WonderVO]

    init(wonders: [WonderVO]) {
        self.wonders = wonders
    }
}

