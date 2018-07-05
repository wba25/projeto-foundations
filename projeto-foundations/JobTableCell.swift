//
//  JobTableCell.swift
//  projeto-foundations
//
//  Created by Wellington Barbosa de Almeida on 27/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class JobTableCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func prepare(with thing: Thing) {
        name.text = thing.title
        price.text = String(thing.price)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        date.text = formatter.string(from: thing.updated_at!)
        if let image = thing.image as? UIImage {
            thumbnail.image = image
        }
    }
}
