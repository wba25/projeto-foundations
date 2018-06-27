//
//  JobViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 25/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class JobViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var jobTableView: UITableView!
    
    lazy var jobs: [Job] = [
        Job(thumbnail:UIImage(named:"objeto-3d-1")!, id:1, name:"Cactus", price:150.0, created_at:"27/06/2018", updated_at:"27/06/2018", status: "Procurando impresssora"),
        Job(thumbnail:UIImage(named:"objeto-3d-2")!, id:1, name:"Iron-Man", price:250.0, created_at:"26/06/2018", updated_at:"26/06/2018", status: "Procurando impresssora"),
        Job(thumbnail:UIImage(named:"objeto-3d-3")!, id:1, name:"Robozim", price:350.0, created_at:"26/06/2018", updated_at:"26/06/2018", status: "Procurando impresssora")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jobTableView.delegate = self
        self.jobTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableCell
        
        cell.thumbnail.image = jobs[indexPath.row].thumbnail
        cell.name.text = jobs[indexPath.row].name
        cell.date.text = jobs[indexPath.row].created_at
        cell.price.text = String(jobs[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}
