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
    
    var name: String
    var url: String
    
    
    private static var sharedCart: Cart = {
        let cart = Cart()
        
        return cart
    }()
    
    private init() {
        self.name = ""
        self.url = ""
    }
    
    class func shared() -> Cart {
        return sharedCart
    }
    
    func getName () -> String{
        return self.name
    }
    
    func setName (name: String) -> Void {
        self.name = name
    }
    
    func getUrl () -> String{
        return self.name
    }
    
    func setUrl (url: String) -> Void {
        self.url = url
    }
}
