//
//  CoreDataTeletabiesApp.swift
//  CoreDataTeletabies
//
//  Created by 青山凱 on 2023/11/25.
//

import SwiftUI

@main
struct CoreDataTeletabiesApp: App {
    
    let controller = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            //  contentsViewに対して、環境変数で、viewContextとして、controllerを付与する。
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
