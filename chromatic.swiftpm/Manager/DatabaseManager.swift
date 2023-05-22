//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static let shared = DatabaseManager()
    
    func saveNewUser(username: String, fullname: String, bio: String = ""){
        let realm = try! Realm()
        
        let user = UserEntity()
        user.username = username
        user.fullname = fullname
        user.bio = bio
        user.games = List<GameEntity>()
        
        do {
            try realm.write {
                realm.add(user)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getUserData() -> [UserEntity] {
        let realm = try! Realm()
        
        let dataUser = realm.objects(UserEntity.self)
            .sorted(byKeyPath: "username", ascending: false)
        
        return dataUser.map { $0 }
    }
    
    
    func addNewGame(username: String, level: Int){
        let realm = try! Realm()
        
        let resultUser = realm.objects(UserEntity.self)
            .where {  $0.username == username}
        
        if let user = resultUser.first {
            let game = GameEntity()
            game.id = UUID().uuidString
            game.level = level
            
            do {
                try realm.write {
                    user.games.append(game)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
