//
//  Order.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 25/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class OrderModel {
    
    var thumbnail: UIImage
    var id: Int
    var name: String
    var price: Float
    var created_at: String
    var updated_at: String
    var status: String
    
    init (thumbnail: UIImage, id: Int, name: String, price: Float, created_at: String, updated_at: String, status: String) {
        self.thumbnail = thumbnail
        self.id = id
        self.name = name
        self.price = price
        self.created_at = created_at
        self.updated_at = updated_at
        self.status = status
    }
}
