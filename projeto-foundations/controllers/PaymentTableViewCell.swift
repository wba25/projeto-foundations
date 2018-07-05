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
    
    func prepare(with formaDePagamento: Pagamento){
        cardFlagImage.image = formaDePagamento.cardFlag
        numberCardLabel.text = formaDePagamento.cardNumber
    }

}
