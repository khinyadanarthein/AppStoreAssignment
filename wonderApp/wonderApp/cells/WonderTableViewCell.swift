//
//  WonderTableViewCell.swift
//  wonderApp
//
//  Created by Khin Yadanar Thein on 13/02/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import UIKit
import SDWebImage

class WonderTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewWonder: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    static var identifier : String {
        return "WonderTableViewCell"
    }
    
    public var wonderData : WonderVO!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(wonderData : WonderVO) {
        self.wonderData = wonderData
        self.imageViewWonder?.sd_setImage(with: URL(string: wonderData.image), completed: nil)
        self.labelName.text = wonderData.location
        //print(wonderData.image)
    }
    
}
