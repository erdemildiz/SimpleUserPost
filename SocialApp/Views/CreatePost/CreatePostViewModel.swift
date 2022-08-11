//
//  CreatePostViewModel.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import Foundation

final class CreatePostViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var message: String = ""
    @Published var imageData = Data()
    
    func sendPost(by userType: String) {
        let userPostObject = UserPost()
        userPostObject.title = title
        userPostObject.message = message
        userPostObject.postImage = imageData
        userPostObject.userType = userType
        RLManager.add(object: userPostObject)
    }
}
