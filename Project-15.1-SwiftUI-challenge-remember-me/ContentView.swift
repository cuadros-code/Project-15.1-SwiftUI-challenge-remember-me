//
//  ContentView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 25/03/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    ListItemUserView(user: user)
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(user)
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { _ in
                AddImageView()
            }
            .navigationDestination(for: User.self) { user in
                DetailUserView(user: user)
            }
            
            
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: "addUser") {
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
