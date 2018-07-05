//
//  ViewController+CoreData.swift
//  projeto-foundations
//
//  Created by Lucas Biagini on 04/07/18.
//  Copyright © 2018 AcademyFoundations. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
