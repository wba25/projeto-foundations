//
//  NewOrderResumeViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 02/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class NewOrderResumeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
            
            let order = Order(context: context)
            thing.order = order
            
            let job = Job(context: context)
            thing.job = job

            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            
//            navigationController?.popViewController(animated: true)
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
