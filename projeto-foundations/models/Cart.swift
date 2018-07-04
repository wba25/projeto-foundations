//
//  Cart.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 27/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import Foundation
import UIKit

class Cart {
    
    var title: String
    var image: UIImage
    var url: String
    var preenchimento: String
    var espessura: String
    var material: String
    var quantidade: String
    var rua: String
    var numero: String
    var complemento: String
    var cep: String
    var creditCard: String
    var cvv: String
    var price: String
    
    
    private static var sharedCart: Cart = {
        let cart = Cart()
        return cart
    }()
    
    private init() {
        self.title = ""
        self.image = UIImage()
        self.url = ""
        self.preenchimento = ""
        self.espessura = ""
        self.material = ""
        self.quantidade = ""
        self.rua = ""
        self.numero = ""
        self.complemento = ""
        self.cep = ""
        self.creditCard = ""
        self.cvv = ""
        self.price = ""
    }
    
    func clearCart () {
        self.title = ""
        self.url = ""
        self.image = UIImage()
        self.preenchimento = ""
        self.espessura = ""
        self.material = ""
        self.quantidade = ""
        self.rua = ""
        self.numero = ""
        self.complemento = ""
        self.cep = ""
        self.creditCard = ""
        self.cvv = ""
        self.price = ""
    }
    
    class func shared() -> Cart {
        return sharedCart
    }
    
    func isSavable() -> Bool {
        return true
    }
    
    func getTitle () -> String{
        return self.title
    }
    
    func setTitle (title: String) -> Void {
        self.title = title
    }
    
    func getImage () -> UIImage {
        return self.image
    }
    
    func setImage (image: UIImage) -> Void {
        self.image = image
    }
    
    func getUrl () -> String{
        return self.url
    }
    
    func setUrl (url: String) -> Void {
        self.url = url
    }
    
    func getPreenchimento () -> String{
        return self.preenchimento
    }
    
    func setPreenchimento (preenchimento: String) -> Void {
        self.preenchimento = preenchimento
    }
    
    func getEspessura () -> String{
        return self.espessura
    }
    
    func setEspessura (espessura: String) -> Void {
        self.espessura = espessura
    }
    
    func getMaterial () -> String{
        return self.material
    }
    
    func setMaterial (material: String) -> Void {
        self.material = material
    }
    
    func getQuantidade () -> String{
        return self.quantidade
    }
    
    func setQuantidade (quantidade: String) -> Void {
        self.quantidade = quantidade
    }
    
    func getRua () -> String{
        return self.rua
    }
    
    func setRua (rua: String) -> Void {
        self.rua = rua
    }
    
    func getNumero () -> String{
        return self.numero
    }
    
    func setNumero (numero: String) -> Void {
        self.numero = numero
    }
    
    func getComplemento () -> String{
        return self.complemento
    }
    
    func setComplemento (complemento: String) -> Void {
        self.complemento = complemento
    }
    
    func getCep () -> String{
        return self.cep
    }
    
    func setCep (cep: String) -> Void {
        self.cep = cep
    }
    
    func getCreditCard () -> String{
        return self.creditCard
    }
    
    func setCreditCard (creditCard: String) -> Void {
        self.creditCard = creditCard
    }
    
    func getCvv () -> String{
        return self.cvv
    }
    
    func setCvv (cvv: String) -> Void {
        self.cvv = cvv
    }
    
    func getPrice () -> String{
        return self.price
    }
    
    func setPrice (price: String) -> Void {
        self.price = price
    }
}
