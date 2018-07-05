//
//  PaymentTableViewCell.swift
//  projeto-foundations
//
//  Created by Hiago Rafael Nunes e Silva on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardFlagImage: UIImageView!
    @IBOutlet weak var numberCardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with payment: Payment) {
        numberCardLabel.text = payment.cardNumber
        if payment.cardNumber!.hasPrefix("4") {
            cardFlagImage.image = UIImage(named: "VisaFlag")
        } else {
            cardFlagImage.image = UIImage(named: "MasterCardFlag")
        }
    }

}
