//
//  PedidoTableCell.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 20/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class OrderTableCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var price: Float = 0.0
    
    func prepare(with thing: Thing) {
        name.text = thing.title
        status.text = thing.status
        price = thing.price
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        date.text = formatter.string(from: thing.updated_at!)
        if let image = thing.image as? UIImage {
            thumbnail.image = image
        }
    }
}
