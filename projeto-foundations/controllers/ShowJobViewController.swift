//
//  ShowJobViewController.swift
//  projeto-foundations
//
//  Created by Rodrigo de Melo Silva on 28/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

class ShowJobViewController: UIViewController {
    
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobName: UILabel!
    @IBOutlet weak var updateJobStatusButton: UIButton!
    
    var jobToShow:JobTableCell? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJob()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadJob(){
        if let job = self.jobToShow {
            self.jobName.text = job.name.text
            self.jobImage.image = job.thumbnail.image
        }
    }
    
    @IBAction func updateJobStatus(_ sender: UIButton) {
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
