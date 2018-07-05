//
//  PaymentExtension.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import CoreData

extension Payment {
    
    override public func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "created_at")
    }
    
}
