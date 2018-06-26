//
//  Category.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 26/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var name: String
    var things: [Thing]
    
    init (name: String, things: [Thing]) {
        self.name = name
        self.things = things
    }
}
