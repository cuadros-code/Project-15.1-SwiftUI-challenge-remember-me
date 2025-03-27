//
//  ContentView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 25/03/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Query() var users: [User]
    
    var body: some View {
        NavigationStack {
            
            List(users) { user in
                Text(user.name)
            }
            
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
