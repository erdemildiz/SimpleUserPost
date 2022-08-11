//
//  PhotoPickerRepresenter.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import SwiftUI
import PhotosUI

struct PhotoPickerRepresenter: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var photoPickerRepresenter: PhotoPickerRepresenter
        
        init(_ photoPickerRepresenter: PhotoPickerRepresenter) {
            self.photoPickerRepresenter = photoPickerRepresenter
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Close selection screen
            picker.dismiss(animated: true)
            // Check If selection or not
            guard let provider = results.first?.itemProvider else { return }
            // If selection have, set
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { [weak self] selectedImage, _ in
                    self?.photoPickerRepresenter.selectedImage = selectedImage as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = context.coordinator
        return pickerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
