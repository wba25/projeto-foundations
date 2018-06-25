import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pedidosTableView: UITableView!
    
    lazy var orders: [Order] = [
        Order(thumbnail:UIImage(named:"image1")!, id:1, name:"Galinha", price:30.0, created_at:"12/06/2018", updated_at:"12/06/2018", status: "Aguardando Impressão"),
        Order(thumbnail:UIImage(named:"image2")!, id:1, name:"Barragem", price:30.0, created_at:"12/06/2018", updated_at:"12/06/2018", status: "Aguardando Impressão"),
        Order(thumbnail:UIImage(named:"image3")!, id:1, name:"Privada", price:30.0, created_at:"12/06/2018", updated_at:"12/06/2018", status: "Aguardando Impressão"),
        Order(thumbnail:UIImage(named:"image4")!, id:1, name:"Roteador", price:30.0, created_at:"12/06/2018", updated_at:"12/06/2018", status: "Aguardando Impressão")
    ]
    
    var currOrder: Order = nil
    
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
        cell.price.text = String(orders[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currOrder = orders[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}
