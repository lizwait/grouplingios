//
//  DataController.swift
//  grouplingios
//
//  Created by Liz Wait on 7/5/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "grouplingios")
    
    init() {
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
