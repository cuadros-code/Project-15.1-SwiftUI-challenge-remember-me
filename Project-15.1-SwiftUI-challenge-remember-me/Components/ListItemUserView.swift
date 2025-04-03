//
//  ListItemUserView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 3/04/25.
//

import SwiftUI

struct ListItemUserView: View {
    
    let user: User
    
    var body: some View {
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

#Preview {
    let data: Data = Data()
    let user = User(name: "Kevin", photo: data, address: "Calle 10 2-23")
    
    ListItemUserView(user: user)
}
