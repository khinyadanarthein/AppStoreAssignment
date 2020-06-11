//
//  WonderPhotoCollectionViewCell.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 14/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import UIKit

class WonderPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewWonder: UIImageView!
    
    static let identifier = "WonderPhotoCollectionViewCell"
    
    public var wonderData : WonderVO!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

}
