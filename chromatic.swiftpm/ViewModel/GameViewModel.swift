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
    @Published var showingAlert = false
    @Published var time = "1:00"
    @Published var minutes: Float = 1.0 {
        didSet {
            self.time = "\(Int(minutes)):00"
        }
    }
    
    @Published var leaderboards: [GameEntity] = []
    
    
    private var initialTime = 0
    private var endDate = Date()
    
    @Published var currentLevel: Int = 1 {
        didSet {
            generateColor()
            generateAnswer()
                currentColumnNum = currentLevel + 1
                currentItemsNum = (currentLevel + 1) * (currentLevel + 1)
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
    
    func generateModifier(){
        currentModifier = currentModifier - 0.01
    }
    
    func generateColor(){
        let red = Double.random(in: 0...255) / 255
        let green = Double.random(in: 0...255) / 255
        let blue = Double.random(in: 0...255) / 255
        let modifier = 0.1
        
        
        print(red)
        print(green)
        print(blue)
        
        self.currentBaseColor = Color(red: red, green: green, blue: blue)
        self.currentAnswerColor = Color(red: red + modifier, green: green + modifier, blue: blue + modifier)
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
        currentLevel = 1
    }
    
    func addNewGame() {
        DatabaseManager.shared.addNewGame(username: currentUsername, level: currentLevel) { result in
            switch(result) {
            case .success():
                self.reset()
                self.showingAlert = false
                print(DatabaseManager.shared.getGameData())
            case .failure(_):
                self.showingAlert = true
            }
        }
    }
    
    
//    func finishGame() {
//        DatabaseManager.shared.addNewGame(username: "rivaldo", level: currentLevel)
//        reset()
//
//        print(DatabaseManager.shared.getGameData())
//    }
    
    func updateCountdown(){
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff <= 0 {
            addNewGame()
            self.isActive = false
            self.showingAlert = true
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
