//
//  UserPostListItem.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import SwiftUI

struct UserPostListItemView: View {
    let post: UserPost
    var body: some View {
        VStack( alignment: .leading, spacing: 16) {
            Text(post.title)
                .font(.system(size: 18))
            Image(uiImage: UIImage(data: post.postImage) ?? UIImage())
                .resizable()
                .scaledToFit()
            Text(post.message)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
}
