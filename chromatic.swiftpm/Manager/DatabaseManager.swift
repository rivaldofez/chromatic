//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation
import RealmSwift

class DatabaseManager {
    enum DatabaseError: Error {
        case usernameExist
        case failedToFetchData
        case cannotCreateDatabase
        case failedToSaveUser
        case failedToAddGame
        case userNotFound
    }
    
    
    static let shared = DatabaseManager()
    
    func saveNewUser(username: String, fullname: String = "", bio: String = "", completion: @escaping (Result<Void, Error>) -> Void){
        
        do {
            let realm = try Realm()
            
            let user = UserEntity()
            user.username = username
            user.games = List<GameEntity>()
            
            if getUserDataByUsername(username: username) == nil {
                do {
                    try realm.write {
                        realm.add(user)
                    }
                    completion(.success(()))
                } catch {
                    completion(.failure(DatabaseError.failedToSaveUser))
                }
            } else {
                completion(.success(()))
            }
        } catch {
            completion(.failure(DatabaseError.cannotCreateDatabase))
        }
    }
    
    func getUserData() -> [UserEntity] {
        let realm = try! Realm()
        
        let dataUser = realm.objects(UserEntity.self)
            .sorted(byKeyPath: "username", ascending: false)
        
        return dataUser.map { $0 }
    }
    
    func getUserDataByUsername(username: String) -> UserEntity? {
        let realm = try! Realm()
        
        let dataUser = realm.objects(UserEntity.self)
            .where { $0.username == username }
        
        return dataUser.map { $0 }.first
    }
    
    func getHighestLevelByUsername(username: String) -> GameEntity? {
        let realm = try! Realm()
        
        let dataGame = realm.objects(GameEntity.self)
            .sorted(byKeyPath: "level", ascending: false)
            .where { $0.username == username }
            
        
        return dataGame.map { $0 }.first
    }
    
    func getGameData() -> [GameEntity] {
        let realm = try! Realm()
        
        let resultGame = realm.objects(GameEntity.self)
            .sorted(byKeyPath: "level", ascending: false)
            .distinct(by: ["username"])
        
        
        return resultGame.map { $0 }
    }
    
    
    func addNewGame(username: String, level: Int, completion: @escaping (Result<Void, Error>) -> Void){
        
        do {
            let realm = try Realm()
            let resultUser = realm.objects(UserEntity.self)
                .where {  $0.username == username}
            
            if let user = resultUser.first {
                let game = GameEntity()
                game.id = UUID().uuidString
                game.level = level
                game.username = username
                
                do {
                    try realm.write {
                        user.games.append(game)
                    }
                    completion(.success(()))
                } catch {
                    completion(.failure(DatabaseError.failedToAddGame))
                }
            } else {
                completion(.failure(DatabaseError.userNotFound))
            }
            
        } catch {
            completion(.failure(DatabaseError.cannotCreateDatabase))
        }
    }
}
