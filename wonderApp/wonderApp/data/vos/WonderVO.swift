//
//  WonderVO.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

// MARK: - Wonder
class WonderVO: Codable {
    let location, wonderDescription: String
    let image: String
    let lat, long: String

    enum CodingKeys: String, CodingKey {
        case location
        case wonderDescription = "description"
        case image, lat, long
    }

    init(location: String, wonderDescription: String, image: String, lat: String, long: String) {
        self.location = location
        self.wonderDescription = wonderDescription
        self.image = image
        self.lat = lat
        self.long = long
    }
}
