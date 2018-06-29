//
//  ThingCollectionViewCell.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 26/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class ThingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thingImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.thingImage.layer.cornerRadius = 5.0
        //self.thingImage.layer.masksToBounds = true
    }
}
