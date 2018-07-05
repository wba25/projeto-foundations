//
//  AddressViewController.swift
//  projeto-foundations
//
//  Created by Hiago Rafael Nunes e Silva on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit
import CoreData

class AddressViewController: UIViewController {
    @IBOutlet weak var addressTableView: UITableView!
    
    var fetchedResultController: NSFetchedResultsController<Address>!
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Você ainda não cadastrou nenhum endereço."
        label.textAlignment = .center
        
        loadAddresses(with: context)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddresses (with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Address> = Address.fetchRequest()
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
        if segue.identifier == "addressToResumeSegue" {
            if let addresses = fetchedResultController.fetchedObjects {
                let cart = CartModel.shared()
                cart.address = addresses[addressTableView.indexPathForSelectedRow!.row]
            }
        }
    }

}


extension AddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        addressTableView.backgroundView = count == 0 ? label : nil
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        guard let payment = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }
        
        cell.prepare(with: payment)
        return cell
    }
    
    
}

extension AddressViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controler: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            addressTableView.reloadData()
        }
    }
}
