import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pedidosTableView: UITableView!
    
    lazy var orders: [Order] = [
        Order(thumbnail:UIImage(named:"yoda")!, id:1, name:"Yoda", price:350.0, created_at:"12/06/2018", updated_at:"26/06/2018", status: "Imprimindo"),
        Order(thumbnail:UIImage(named:"groot")!, id:1, name:"Groot", price:300.0, created_at:"25/05/2018", updated_at:"12/06/2018", status: "Saiu para entrega"),
        Order(thumbnail:UIImage(named:"plier")!, id:1, name:"Extrovenga", price:320.0, created_at:"24/04/2018", updated_at:"12/06/2018", status: "Entrege")
    ]
    
//    var currOrder: Order = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pedidosTableView.delegate = self
        self.pedidosTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableCell
        
        cell.thumbnail.image = orders[indexPath.row].thumbnail
        cell.name.text = orders[indexPath.row].name
        cell.date.text = orders[indexPath.row].created_at
        cell.status.text = String(orders[indexPath.row].status)
        
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.currOrder = orders[indexPath.row]
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
}
