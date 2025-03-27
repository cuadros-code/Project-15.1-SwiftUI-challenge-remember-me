//
//  AddImageView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 26/03/25.
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
    
    @State private var pickerImage: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        NavigationStack {
            PhotosPicker(
                selection: $pickerImage,
                matching: .images
            ) {
                if selectedImage != nil {
                    selectedImage?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(.circle)
                        
                } else {
                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundStyle(.black)
                        .frame(width: 200, height: 200)
                        .background(.gray.opacity(0.2))
                        .clipShape(.circle)
                }
            }
            
            .onChange(of: pickerImage) {
                Task {
                    selectedImage = try await pickerImage?
                        .loadTransferable(type: Image.self)
                }
            }
        }
    }
}

#Preview {
    AddImageView()
}
