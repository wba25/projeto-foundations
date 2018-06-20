//
//  ViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 20/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var pedidosTableView: UITableView!
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PedidoTableCell()
        return cell
    }
}

