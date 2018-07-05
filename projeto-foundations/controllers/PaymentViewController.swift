//
//  PaymentViewController.swift
//  projeto-foundations
//
//  Created by Hiago Rafael Nunes e Silva on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit
import CoreData

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var paymentsTableView: UITableView!
    var fetchedResultController: NSFetchedResultsController<Payment>!
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Você ainda não cadastrou nenhum método de pagamento."
        label.textAlignment = .center
        
        loadPayments(with: context)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadPayments (with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Payment> = Payment.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "created_at", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paymentToAddressSegue" {
            if let payments = fetchedResultController.fetchedObjects {
                let cart = CartModel.shared()
                cart.payment = payments[paymentsTableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return formasDePagamento.count
        
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        paymentsTableView.backgroundView = count == 0 ? label : nil
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("entrou")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        print("Passou")
        
        guard let payment = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }
        
        cell.prepare(with: payment)
        return cell
    }
    
}

extension PaymentViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controler: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            paymentsTableView.reloadData()
        }
    }
}
