//
//  NewOrderResumeViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 02/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class NewOrderResumeViewController: UIViewController {

    
    @IBOutlet weak var imageModelImageView: UIImageView!
    @IBOutlet weak var modelTitleLabel: UILabel!
    @IBOutlet weak var fillLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var thicknessLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cardFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cart = CartModel.shared()
        imageModelImageView.image = cart.image
        modelTitleLabel.text = cart.title
        fillLabel.text = "\(cart.fill)"
        materialLabel.text = cart.material + ", " + cart.color
        thicknessLabel.text = "\(cart.thickness)" + " mm"
        cardNumberLabel.text = cart.payment.cardNumber
        cardFlagImageView.image = cart.payment.cardNumber!.hasPrefix("4") ? UIImage(named: "VisaFlag") : UIImage(named: "MasterCardFlag")
        addressLabel.text = cart.address.rua! + " " + cart.address.numero!  + ", CEP " + cart.address.cep!
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finalizeOrder(_ sender: UIButton) {
        let cart = CartModel.shared()
        
        if (cart.isSavable()) {
            let thing = Thing(context: context)
            thing.image = cart.image
            thing.title = cart.title
            thing.fill = cart.fill
            thing.thickness = cart.thickness
            thing.material = cart.material
            thing.color = cart.color
            thing.payment = cart.payment
            thing.address = cart.address
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            navigationController?.popViewController(animated: true)
            //nao funcionou
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
