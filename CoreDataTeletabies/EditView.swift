//
//  EditView.swift
//  CoreDataTeletabies
//
//  Created by 青山凱 on 2023/11/26.
//

import SwiftUI

struct EditView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    private var user: User
    
    @State private var name: String
    
    init(user: User) {
        self.user = user
        self.name = user.name ?? ""
    }
    
    var body: some View {
        VStack {
            Text("編集画面")
                .font(.title)
                .padding()
            TextField("test", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Button("編集内容を記録する") {
                save()
            }
        }
    }
    
    private func save() {
        user.name = self.name
        try? viewContext.save()
    }
}

#Preview {
    EditView(user: User())
}
