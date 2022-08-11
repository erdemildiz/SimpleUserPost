//
//  UserPost.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import Foundation
import RealmSwift

final class UserPost: Object {
    @Persisted var title: String = ""
    @Persisted var username: String
    @Persisted var message: String = ""
    @Persisted var postImage = Data()
    @Persisted var userType: String
}
