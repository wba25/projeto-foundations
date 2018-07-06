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
            
            let labelTitle = buttonLabel(status: job.thing.status!)
            self.updateJobStatusButton.setTitle(labelTitle, for: [])
            
            if labelTitle == "Finalizado" {
                self.updateJobStatusButton.isEnabled = false
            }
        }
    }
    
    @IBAction func updateJobStatus(_ sender: UIButton) {
        
        if let job = self.jobToShow {
            
            let thing = job.thing
            
            if (thing.status != "Enviado") {
                thing.status = nextJobStatus(status: thing.status!)
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
                self.updateJobStatusButton.setTitle(buttonLabel(status: thing.status!), for: [])
            }
        }
    }
    
    func nextJobStatus (status: String) -> String {
        if status == "Solicitado" {
            return "Pronto para imprimir"
        } else if status == "Pronto para imprimir" {
            return "Imprimindo"
        } else { // status == Imprimindo    
            return "Enviado"
        }
    }
    
    func buttonLabel (status: String) -> String {
        if status == "Solicitado" {
            return "Aceitar Demanda"
        } else if status == "Pronto para imprimir" {
            return "Começar Impressão"
        } else if status == "Imprimindo" {
            return "Impressão Encerrada"
        } else if status == "Impresso" {
            return "Produto Enviado"
        } else { // status == "Enviado"
            return "Finalizado" // teoricamente nunca vai entrar, botei só por ser obrigado a retornar algo
        }
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
