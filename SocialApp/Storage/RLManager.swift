//
//  UserPost.swift
//  SocialApp
//
//  Created by Erdem ILDIZ on 11.08.2022.
//

import Foundation
import RealmSwift

struct RLManager {
    static private var realm: Realm = {
        let configuration = Realm.Configuration(schemaVersion: 1)
        guard let realm = try? Realm(configuration: configuration) else {
            return try! Realm()
        }
        return realm
    }()
    static var path: String {
        realm.configuration.fileURL!.absoluteString
    }
    // MARK: Get
    static func get(_ object: Object.Type) -> [Object] {
        return Array(realm.objects(object.self))
    }
    // MARK: Add    
    static func add(object: Object) {
        do {
            try self.realm.write {
                self.realm.add(object)
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
