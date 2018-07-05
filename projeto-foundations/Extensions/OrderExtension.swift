//
//  OrderExtension.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 05/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import CoreData

extension Order {
    
    override public func willSave() {
        if let updated_at = updated_at {
            if updated_at.timeIntervalSince(Date()) > 10.0 {
                self.updated_at = Date()
            }
            
        } else {
            self.updated_at = Date()
        }
    }
    
    override public func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "created_at")
    }
    
}
