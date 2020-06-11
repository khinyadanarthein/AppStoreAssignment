//
//  DetailViewController.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 16/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageViewCity: UIImageView!
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelLattitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    static var identifier : String {
        return "DetailViewController"
    }
    
    public var cityData : WonderVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewCity.sd_setImage(with: URL(string: cityData.image), completed: nil)
        labelCityName.text = cityData.location
        labelLattitude.text = cityData.lat
        labelLongitude.text = cityData.long
        labelDescription.text = cityData.wonderDescription
    }
    

}
