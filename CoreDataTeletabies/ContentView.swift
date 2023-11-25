//
//  ContentView.swift
//  CoreDataTeletabies
//
//  Created by 青山凱 on 2023/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var userList: FetchedResults<User>
    
    var body: some View {
        List(userList) { userObj in
            if let name = userObj.name {
                Text(name)
            }
        }
        
        Button(action: {
            let user = User(context: viewContext)
            user.name = "ユーザー１"
            
            do {
                try viewContext.save()
            } catch {
                fatalError("DBへの書き込み失敗。。。orz")
            }
        }, label: {
            Text("Button")
        })
    }
}

#Preview {
    ContentView()
}
