//
//  UserPostListView.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import SwiftUI

struct UserPostListView: View {
    @StateObject var viewModel = UserPostListViewModel()
    let userType: String
    var body: some View {
        List {
            VStack {
                if !viewModel.userPosts.isEmpty {
                    ForEach(viewModel.userPosts, id: \.self) { post in
                        UserPostListItemView(post: post)
                    }
                } else {
                    Text("There is no post for " + userType)
                }
            }
            .navigationTitle(userType + " Posts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CreatePostView(userType: userType)
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .onAppear { viewModel.getUserPost(by: userType) }
        }
    }
}
