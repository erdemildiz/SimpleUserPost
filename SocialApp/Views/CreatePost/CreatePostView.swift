//
//  CreatePostView.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 10.08.2022.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    let userType: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = CreatePostViewModel()
    @State private var selectedImage: Image?
    @State private var pickerImage: UIImage?
    @State private var showImagePicker = false
    var body: some View {
        VStack {
            List {
                TextField("Title", text: $viewModel.title)
                TextField("Post Message", text: $viewModel.message)
                Button("Pick post image") {
                    showImagePicker.toggle()
                }
                selectedImage?
                    .resizable()
                    .scaledToFit()
            }
            Button {
                viewModel.sendPost(by: userType)
                presentationMode.wrappedValue.dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 50)
                    .padding()
                    .overlay(
                        Text("Send Post")
                            .foregroundColor(.white)
                    )
            }

        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPickerRepresenter(selectedImage: $pickerImage)
        }
        .onChange(of: pickerImage) { _ in loadSelectedImage() }
    }
    
    private func loadSelectedImage() {
        guard let pickerImage = pickerImage else {
            return
        }
        selectedImage = Image(uiImage: pickerImage)
        viewModel.imageData = pickerImage.jpegData(compressionQuality: 0.5) ?? Data()
    }
}
