import UIKit
import CoreData

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fetchedResultController: NSFetchedResultsController<Thing>!
    var label = UILabel()
    
    @IBOutlet weak var pedidosTableView: UITableView!
    
    lazy var orders: [OrderModel] = [
        OrderModel(thumbnail:UIImage(named:"yoda")!, id:1, name:"Yoda", price:350.0, created_at:"12/06/2018", updated_at:"26/06/2018", status: "Imprimindo"),
        OrderModel(thumbnail:UIImage(named:"groot")!, id:1, name:"Groot", price:300.0, created_at:"25/05/2018", updated_at:"12/06/2018", status: "Saiu para entrega"),
        OrderModel(thumbnail:UIImage(named:"plier")!, id:1, name:"Alicate Predador", price:320.0, created_at:"24/04/2018", updated_at:"12/06/2018", status: "Entrege")
    ]
    
//    var currOrder: Order = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pedidosTableView.delegate = self
        self.pedidosTableView.dataSource = self
        
        label.text = "Você ainda não fez nenhum pedido."
        label.textAlignment = .center
        
        loadOrders(with: context)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return orders.count
        
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        pedidosTableView.backgroundView = count == 0 ? label : nil
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableCell
//
//        cell.thumbnail.image = orders[indexPath.row].thumbnail
//        cell.name.text = orders[indexPath.row].name
//        cell.date.text = orders[indexPath.row].created_at
//        cell.status.text = String(orders[indexPath.row].status)
        
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
        
        let currentCell = tableView.cellForRow(at: indexPath!) as! OrderTableCell
        
        performSegue(withIdentifier: "ShowOrderSegue", sender: currentCell)
        /*
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowOrderSegue") {
            self.present(vc, animated: true, completion: nil)
        }
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOrderSegue" {
            if let vc = segue.destination as? ShowOrderViewController {
                if let sd = sender as? OrderTableCell {
                    vc.orderToShow = sd
                }
            }
            
        }
    }
    
    func loadOrders (with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Thing> = Thing.fetchRequest()
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

extension OrderViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controler: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            break
        default:
            pedidosTableView.reloadData()
        }
    }
}
