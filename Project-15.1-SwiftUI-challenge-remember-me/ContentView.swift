//
//  ContentView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 25/03/25.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @Query var users: [User]
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        if let uiImage = UIImage(data: user.photo) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.address)
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.leading, 15)
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
