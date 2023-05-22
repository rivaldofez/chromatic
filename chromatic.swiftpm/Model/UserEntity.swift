//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @Persisted(primaryKey: true) var username: String
    @Persisted var fullname: String
    @Persisted var createdAt: Date = Date()
    @Persisted var bio: String = ""
    @Persisted var games: List<GameEntity>
    
}
