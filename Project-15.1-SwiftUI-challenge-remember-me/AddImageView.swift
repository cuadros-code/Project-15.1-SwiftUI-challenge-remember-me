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
            
            selectedImage?
                .resizable()
                .scaledToFit()
            
            PhotosPicker(
                selection: $pickerImage,
                matching: .images
            ) {
                Button("Add") {}
                    .padding()
                    .background(.gray.opacity(0.2))
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
