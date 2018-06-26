//
//  Thing.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 26/06/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import Foundation
import UIKit

class Thing {
    
    var image: UIImage
    var name: String
    var description: String
    
    init (image: UIImage, name: String, description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
}
