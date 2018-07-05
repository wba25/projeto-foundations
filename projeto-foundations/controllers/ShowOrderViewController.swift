//
//  ShowOrderViewController.swift
//  projeto-foundations
//
//  Created by Wellington Barbosa de Almeida on 28/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class ShowOrderViewController: UIViewController {
    
    @IBOutlet weak var fillLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var thickness: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var imageTumbnail: UIImageView!
    
    var orderToShow:OrderTableCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOrder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadOrder(){
        if let ord = self.orderToShow {
            self.labelStatus.text = ord.status.text
            self.imageTumbnail.image = ord.thumbnail.image
            self.labelPrice.text = String(ord.price)
            // TODO: consultar preço da base de dados - self.labelPrice.text = 
        }
    }
    
}
