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
    
    private var initialTime = 0
    private var endDate = Date()
    
    @Published var currentLevel: Int = 1 {
        didSet {
            currentColumnNum = currentLevel + 1
        }
    }
    @Published var currentColumnNum: Int = 2
    @Published var currentBaseColor: Color = .red
    @Published var currentAnswerColor: Color = .blue
    @Published var currentAnswer: Int = -1
    
    
    func generateAnswer(){
        let maxItems = currentColumnNum * currentColumnNum
        self.currentAnswer = Int.random(in: 1...maxItems)
    }
    
    func generateColor(){
        let red = Double.random(in: 0...255) / 255
        let green = Double.random(in: 0...255) / 255
        let blue = Double.random(in: 0...255) / 255
        let modifier = 0.5
        
        
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
        self.minutes = Float(initialTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    func updateCountdown(){
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff <= 0 {
            self.isActive = false
            self.time = "0:00"
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
    
}
