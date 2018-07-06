//
//  JobViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 25/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit
import CoreData

class JobViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var jobTableView: UITableView!
    
    var fetchedResultController: NSFetchedResultsController<Thing>!
    var label = UILabel()
    
    lazy var jobs: [JobModel] = [
        JobModel(thumbnail:UIImage(named:"objeto-3d-1")!, id:1, name:"Cactus", price:150.0, created_at:"27/06/2018", updated_at:"27/06/2018", status: "Procurando impresssora"),
        JobModel(thumbnail:UIImage(named:"objeto-3d-2")!, id:1, name:"Iron-Man", price:250.0, created_at:"26/06/2018", updated_at:"26/06/2018", status: "Procurando impresssora"),
        JobModel(thumbnail:UIImage(named:"objeto-3d-3")!, id:1, name:"Robozim", price:350.0, created_at:"26/06/2018", updated_at:"26/06/2018", status: "Procurando impresssora")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jobTableView.delegate = self
        self.jobTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        label.text = "Não temos nenhuma demanda no momento."
        label.textAlignment = .center
        
        loadOrders(with: context)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return jobs.count
        
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        jobTableView.backgroundView = count == 0 ? label : nil
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableCell
        
//        cell.thumbnail.image = jobs[indexPath.row].thumbnail
//        cell.name.text = jobs[indexPath.row].name
//        cell.date.text = jobs[indexPath.row].created_at
//        cell.price.text = String(jobs[indexPath.row].price)
        
        guard let thing = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }
        
        cell.prepare(with: thing)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!) as! JobTableCell
        
        performSegue(withIdentifier: "ShowJobSegue", sender: currentCell)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowJobSegue" {
            if let vc = segue.destination as? ShowJobViewController {
                if let sd = sender as? JobTableCell {
                    vc.jobToShow = sd
                }
            }
            
        }
    }
    
    func loadOrders (with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Thing> = Thing.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "status != 'Enviado'")
        let sortDescriptor = NSSortDescriptor(key: "updated_at", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }

}

extension JobViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controler: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            jobTableView.reloadData()
        }
    }
}
