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
    
    var body: some View {
        NavigationStack {
            List(users) { user in
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
                    }
                    .padding(.leading, 15)
                }
            }
            
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddImageView()
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
