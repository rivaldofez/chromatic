//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation
import SwiftUI


class GameViewModel: ObservableObject {
    @Published var isActive = false
    @Published var isShowResult = false
    @Published var time = "1:00"
    @Published var minutes: Float = 1.0 {
        didSet {
            self.time = "\(Int(minutes)):00"
        }
    }
    
    @Published var leaderboards: [GameEntity] = []
    
    
    private var initialTime = 0
    private var endDate = Date()
    @Published var latestLevelAchieved = 0
    @Published var highestLevelAchieved = 0
    
    @Published var currentLevel: Int = 1 {
        didSet {
            generateColor()
            generateAnswer()
                currentColumnNum = generateColumn(level: currentLevel)
                currentItemsNum = currentColumnNum * currentColumnNum
                currentModifier = currentModifier - ((Double(currentLevel / 10)) / 100)
            getShapeStyle()
        }
    }
    
    @Published var currentUsername: String = ""
    @Published var currentColumnNum: Int = 2
    @Published var currentItemsNum: Int = 4
    @Published var currentBaseColor: Color = .red
    @Published var currentAnswerColor: Color = .blue
    @Published var currentAnswer: Int = -1
    @Published var currentModifier: Double = 0.1
    @Published var currentShapeStyle: String = "circle"
    
    
    func saveNewUser(username: String, fullname: String = "", bio: String = "", completion: @escaping (Result<Void, Error>) -> Void){
        DatabaseManager.shared.saveNewUser(username: username, fullname: fullname, completion: completion)
        
        currentUsername = username
    }
    
    func generateAnswer(){
        self.currentAnswer = Int.random(in: 1...currentItemsNum)
    }

    func generateColor(){
        let red = Double.random(in: 0...255) / 255
        let green = Double.random(in: 0...255) / 255
        let blue = Double.random(in: 0...255) / 255
        
        
        print(red)
        print(green)
        print(blue)
        
        self.currentBaseColor = Color(red: red, green: green, blue: blue)
        self.currentAnswerColor = Color(red: red + currentModifier, green: green + currentModifier, blue: blue + currentModifier)
    }
    
    private func generateColumn(level: Int) -> Int{
        let mod = level % 10
        
        if (mod <= 0) {
            return 11
        } else {
            return mod + 1
        }
    }
    
    func start(minutes: Float) {
        self.initialTime = Int(minutes)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
    }
    
    func reset() {
        self.minutes = 1.0
        self.isActive = false
        self.time = "\(Int(minutes)):00"
        latestLevelAchieved = currentLevel
        currentLevel = 1
    }
    
    func addNewGame() {
        DatabaseManager.shared.addNewGame(username: currentUsername, level: currentLevel) { result in
            switch(result) {
            case .success():
                print(DatabaseManager.shared.getGameData())
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getHighestLevel(){
        self.highestLevelAchieved = DatabaseManager.shared.getHighestLevelByUsername(username: currentUsername)?.level ?? 0
    }
    
    func updateCountdown(){
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff <= 0 {
            addNewGame()
            self.isActive = false
            self.isShowResult = true
            self.reset()
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        self.minutes = Float(minutes)
        self.time = String(format: "%d:%02d", minutes, seconds)
    }
    
    func getShapeStyle(){
        currentShapeStyle = UserDefaults.standard.string(forKey: "shape") ?? "circle"
    }
    
    func setShapeStyle(shape: String){
        UserDefaults.standard.set(shape, forKey: "shape")
        getShapeStyle()
    }
    
    func getGameData(){
        self.leaderboards = DatabaseManager.shared.getGameData()
    }
    
}
