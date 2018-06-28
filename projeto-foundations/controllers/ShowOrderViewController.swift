//
//  ShowOrderViewController.swift
//  projeto-foundations
//
//  Created by Wellington Barbosa de Almeida on 28/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class ShowOrderViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelData: UILabel!
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
            self.labelName.text = ord.name.text
            self.labelData.text = ord.date.text
            self.labelStatus.text = ord.status.text
            self.imageTumbnail.image = ord.thumbnail.image
            
        }
    }
    
}
