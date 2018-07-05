//
//  PaymentViewController.swift
//  projeto-foundations
//
//  Created by Hiago Rafael Nunes e Silva on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

struct Pagamento {
    var cardNumber: String
    var date: String
    var cardFlag: UIImage
    
    init(cardNumber: String, date: String, cardFlag: UIImage) {
        self.cardNumber = cardNumber
        self.date = date
        self.cardFlag = cardFlag
    }
}

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var paymentsTableView: UITableView!
    var formasDePagamento: [Pagamento] = [Pagamento(cardNumber: "1234 5678 9101", date: "12/22", cardFlag: #imageLiteral(resourceName: "MasterCardFlag")),Pagamento(cardNumber: "567 8910 1112", date: "10/24", cardFlag: #imageLiteral(resourceName: "VisaFlag"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formasDePagamento.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("entrou")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        print("Passou")
        cell.prepare(with: formasDePagamento[indexPath.row])
        return cell
    }
    
    
}

