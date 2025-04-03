//
//  DetailUserView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 1/04/25.
//

import SwiftUI
import SwiftData

struct DetailUserView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            if let image = UIImage(data: user.photo) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
            }
            
            VStack(alignment: .leading) {
                Text("Name: " + user.name)
                    .font(.headline)
                Text("Address: " + user.address)
                    .font(.headline)
            }
            .padding([.leading])
            Spacer()
     
        }
    }
}

#Preview {
    let data: Data = Data()
    
    let user = User(name: "Kevin", photo: data, address: "Calle 10 2-23")
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        return DetailUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container")
    }
}
