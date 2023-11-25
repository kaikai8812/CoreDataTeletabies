//
//  PersistenceController.swift
//  CoreDataTeletabies
//
//  Created by 青山凱 on 2023/11/25.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "UserModel")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("エラーが発生：\(error.localizedDescription)")
            }
        }
    }
}
