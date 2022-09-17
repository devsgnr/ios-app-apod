//
//  Main.swift
//  NASA
//
//  Created by Emmanuel Watila on 16/09/2022.
//

import Foundation
import CoreData
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        return controller
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PicturesCoreModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores{description, error in
            if let error = error {
                fatalError("Error: \(error)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                let alert = UIAlertController(title: nil, message: "Saved", preferredStyle: .alert)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    alert.dismiss(animated: true)
                }
            } catch let saveError {
                fatalError("Error: \(saveError)")
            }
        }
    }
}
