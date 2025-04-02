//
//  AddImageView.swift
//  Project-15.1-SwiftUI-challenge-remember-me
//
//  Created by Kevin Cuadros on 26/03/25.
//

import SwiftUI
import PhotosUI

struct AddImageView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var pickerImage: PhotosPickerItem?
    @State private var selectedImage: Data?
    @State private var image: UIImage?
    
    @State private var name = ""
    @State private var address = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select a picture") {
                    HStack {
                        Spacer()
                        PhotosPicker(
                            selection: $pickerImage,
                            matching: .images
                        ) {
                            if let selectedImage = selectedImage,
                                let uiImage = UIImage(data: selectedImage) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(.circle)
                            }  else {
                                Image(systemName: "photo")
                                    .font(.title)
                                    .foregroundStyle(.black)
                                    .frame(width: 200, height: 200)
                                    .background(.gray.opacity(0.2))
                                    .clipShape(.circle)
                            }
                        }
                        Spacer()
                    }
                }
                
                Section("Additional Information") {
                    TextField("Name", text: $name)
                    TextField("Address", text: $address)
                }
                
                Section {
                    Button {
                        save()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save")
                            Spacer()
                        }
                    }
                }
            }
            
            .onChange(of: pickerImage) {
                Task {
                    if let data = try await pickerImage?.loadTransferable(
                        type: Data.self
                    ) {
                        selectedImage = data
                    }
                }
            }
        }
    }
    
    func save() {
        if (selectedImage != nil) {
            let user = User(name: name, photo: selectedImage!, address: address)
            modelContext.insert(user)
        }
    }
}

#Preview {
    AddImageView()
}
