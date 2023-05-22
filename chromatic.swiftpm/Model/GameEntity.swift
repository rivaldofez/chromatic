//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    @Persisted var level: Int = 0
    @Persisted var id: String
}
