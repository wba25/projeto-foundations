//
//  NewOrderViewController.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 25/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit

var fills = ["100% (Objeto sólido)", "50%", "33%", "25%", "20%", "17%", "12,5%", "10%", "5%", "2,5%", "0% (Objeto ôco)"]
var fillsFloat: [Float] = [1.0, 0.5, 0.33, 0.25, 0.2, 0.17, 0.125, 0.1, 0.05, 0.025, 0.0]
var thicknesses = ["0,1 mm", "0,2 mm", "> 0,2 mm"]
var thicknessesFloat: [Float] = [0.1, 0.2, 0.3]
var materials = [
    ["PLA", "ABS"],
    ["Branco", "Cinza", "Preto", "Vermelho", "Laranja", "Amarelo", "Verde", "Azul", "Roxo"]
]
var quantities: [Int] = Array(1...100)

class NewOrderViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var loadModelButton: UIButton!
    @IBOutlet weak var modelImageView: UIImageView!
    @IBOutlet weak var fillTextField: UITextField!
    @IBOutlet weak var thicknessTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    var currPickerView: String = ""
        
        
    lazy var fillPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    lazy var thicknessPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    lazy var materialPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    lazy var quantityPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleTextField.delegate = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y:0, width: view.frame.width, height: 44))
        toolbar.tintColor = UIColor(named: "orangeColor")
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let btFlexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.items = [btCancel, btFlexibleSpace, btDone]
        
        self.fillTextField.inputView = fillPickerView
        self.fillTextField.inputAccessoryView = toolbar
        self.thicknessTextField.inputView = thicknessPickerView
        self.thicknessTextField.inputAccessoryView = toolbar
        self.materialTextField.inputView = materialPickerView
        self.materialTextField.inputAccessoryView = toolbar
        self.quantityTextField.inputView = quantityPickerView
        self.quantityTextField.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }
    
    @objc func cancel() {
        
        if (self.currPickerView == "fill") {
            fillTextField.resignFirstResponder()
        } else if (self.currPickerView == "thickness") {
            thicknessTextField.resignFirstResponder()
        } else if (self.currPickerView == "material") {
            materialTextField.resignFirstResponder()
        } else if (self.currPickerView == "quantity") {
            quantityTextField.resignFirstResponder()
        }
    }
    
    @objc func done() {
        print(self.currPickerView)
        if (self.currPickerView == "fill") {
            fillTextField.text = fills[fillPickerView.selectedRow(inComponent: 0)]
        } else if (self.currPickerView == "thickness") {
            thicknessTextField.text = thicknesses[thicknessPickerView.selectedRow(inComponent: 0)]
        } else if (self.currPickerView == "material") {
            materialTextField.text = materials[0][materialPickerView.selectedRow(inComponent: 0)] + ", " + materials[1][materialPickerView.selectedRow(inComponent: 1)]
        } else if (self.currPickerView == "quantity") {
            quantityTextField.text = String(quantities[quantityPickerView.selectedRow(inComponent: 0)])
        }
        cancel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "newOrderSettingsSegue") {
            let cart: CartModel = CartModel.shared()
            cart.title = self.titleTextField.text!
            cart.fill = fillsFloat[fillPickerView.selectedRow(inComponent: 0)]
            cart.thickness = thicknessesFloat[thicknessPickerView.selectedRow(inComponent: 0)]
            cart.material = materials[0][materialPickerView.selectedRow(inComponent: 0)]
            cart.color = materials[1][materialPickerView.selectedRow(inComponent: 0)]
            cart.quantity = Int(self.quantityTextField.text!)!
            if (self.modelImageView.image != nil) {
                cart.image = self.modelImageView.image!
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            print("Moving from parent")
            CartModel.shared().clearCart()
            print(CartModel.shared().title)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "newOrderSettingsSegue") {
            return self.titleTextField.text!.count > 0
        }
        
        return false
    }

    @IBAction func loadModel(_ sender: UIButton) {
        let alert = UIAlertController(title: "Carregar modelo", message: "De onde você quer escolher o modelo?", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title:"Scanear modelo", style: .default, handler: { (action: UIAlertAction) in
                self.selectPicture(sourceType: .camera)
            })
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title:"Escolher arquivo", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction (title: "iCloud", style: .default) { (action: UIAlertAction) in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture (sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
//        imagePicker.navigationBar.tintColor = UIColor(named:"orangeColor")
        present(imagePicker, animated: true, completion: nil)
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

extension NewOrderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        modelImageView.image = image
        loadModelButton.setTitle(nil, for: .normal)
        dismiss(animated: true, completion: nil)
    }
}

extension NewOrderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == self.fillPickerView) {
            self.currPickerView = "fill"
        } else if (pickerView == self.thicknessPickerView) {
            self.currPickerView = "thickness"
        } else if (pickerView == self.materialPickerView) {
            self.currPickerView = "material"
            return 2
        } else if (pickerView == self.quantityPickerView) {
            self.currPickerView = "quantity"
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == self.fillPickerView) {
            return fills.count
        } else if (pickerView == self.thicknessPickerView) {
            return thicknesses.count
        } else if (pickerView == self.materialPickerView) {
            return materials[component].count
        } else if (pickerView == self.quantityPickerView) {
            return quantities.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == self.fillPickerView) {
            return fills[row]
        } else if (pickerView == self.thicknessPickerView) {
            return thicknesses[row]
        } else if (pickerView == self.materialPickerView) {
            return materials[component][row]
        } else if (pickerView == self.quantityPickerView) {
            return String(quantities[row])
        }
        
        return ""
    }
}

extension NewOrderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
