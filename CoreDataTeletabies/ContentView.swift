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
    
    @State var inputName = "入力前"
    
    var body: some View {
        NavigationStack {
            
            
            List(userList) { userObj in
                if let name = userObj.name {
                    NavigationLink {
                        EditView(user: userObj)
                    } label: {
                        Text(name)
                    }
                }
            }
            
            TextField("名前を入力してください", text: $inputName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                let user = User(context: viewContext)
                user.name = inputName
                inputName = "初期化する"
                do {
                    try viewContext.save()
                } catch {
                    fatalError("DBへの書き込み失敗。。。orz")
                }
            }, label: {
                Text("Button")
            })
            .padding()
        }
        .navigationTitle("Top")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
