//
//  HomeViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 25/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var categories = [
        Category(name: "Recentes", things: [
            ThingModel(image: UIImage(named:"yoda")!, name:"Yoda", description:"Yoda para prateleira"),
            ThingModel(image: UIImage(named:"groot")!, name:"Groot", description:"Pequeno Groot decorativo"),
            ThingModel(image: UIImage(named:"plier")!, name:"Plier", description:"Alicate predador complexo")
        ]),
        Category(name: "Populares", things: [
            ThingModel(image: UIImage(named:"objeto-3d-1")!, name:"Cacto", description:"Cacto para jardins"),
            ThingModel(image: UIImage(named:"objeto-3d-2")!, name:"Homem de Ferro", description:"Capacete fantasia de carnaval"),
            ThingModel(image: UIImage(named:"objeto-3d-3")!, name:"Robô", description:"Robô peso para papel")
            ]),
        Category(name: "Sugeridos", things: [
            ThingModel(image: UIImage(named:"sugeridos-1")!, name:"Kinderovo 3D", description:"Kinderovo imprimível"),
            ThingModel(image: UIImage(named:"sugeridos-2")!, name:"Ovos de Dragão", description:"Com dragões dentro!"),
            ThingModel(image: UIImage(named:"sugeridos-3")!, name:"Controle Remoto", description:"Controle cyberpunk 1980x")
            ])
    ]

    @IBOutlet weak var categoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoriesTableView.delegate = self
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.allowsSelection = false
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        cell.name.text = categories[indexPath.row].name
        cell.things = categories[indexPath.row].things
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
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
