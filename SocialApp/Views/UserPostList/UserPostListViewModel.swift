//
//  UserPostListViewModel.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import Foundation

final class UserPostListViewModel: ObservableObject {
    @Published var userPosts: [UserPost] = []
    
    func getUserPost(by userType: String) {
        if let userPostList = RLManager.get(UserPost.self) as? [UserPost] {
            self.userPosts = userPostList.filter { $0.userType ==  userType }
        } else {
            userPosts.removeAll()
        }
    }
}
