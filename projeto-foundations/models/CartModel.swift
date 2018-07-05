//
//  Cart.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 27/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import Foundation
import UIKit

class CartModel {
    
    var title: String
    var image: UIImage
    var url: String
    var fill: Float
    var thickness: Float
    var material: String
    var color: String
    var quantity: Int
    var rua: String
    var numero: String
    var complemento: String
    var cep: String
    var creditCard: String
    var cvv: String
    var price: String
    var payment: Payment
    var address: Address
    
    
    private static var sharedCart: CartModel = {
        let cart = CartModel()
        return cart
    }()
    
    private init() {
        self.title = ""
        self.image = UIImage()
        self.url = ""
        self.fill = -1.0
        self.thickness = -1.0
        self.material = ""
        self.color = ""
        self.quantity = -1
        self.rua = ""
        self.numero = ""
        self.complemento = ""
        self.cep = ""
        self.creditCard = ""
        self.cvv = ""
        self.price = ""
        self.payment = Payment()
        self.address = Address()
    }
    
    func clearCart () {
        self.title = ""
        self.url = ""
        self.image = UIImage()
        self.fill = -1.0
        self.thickness = -1.0
        self.material = ""
        self.quantity = -1
        self.rua = ""
        self.numero = ""
        self.complemento = ""
        self.cep = ""
        self.creditCard = ""
        self.cvv = ""
        self.price = ""
        self.payment = Payment()
        self.address = Address()
    }
    
    class func shared() -> CartModel {
        return sharedCart
    }
    
    func isSavable() -> Bool {
        return true
    }
}
