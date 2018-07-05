//
//  AddressTableViewCell.swift
//  projeto-foundations
//
//  Created by Hiago Rafael Nunes e Silva on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
