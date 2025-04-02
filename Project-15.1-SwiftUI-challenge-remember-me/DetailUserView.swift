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
        
        Text(user.name)
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
