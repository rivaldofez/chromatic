//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 22/05/23.
//

import Foundation
import SwiftUI
import HalfASheet

struct GameView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isShowAlertRestart: Bool = false
    
    
    var body: some View {
        GeometryReader { screen in
            ZStack{
                VStack {
                    
                    BackButtonView {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.leading)
                    
                    Text("Please \(Text("Choose").foregroundColor(.primaryAccentLabel)) the \(Text("Different Color").foregroundColor(.primaryAccentLabel))")
                        .font(.system(.title2).bold())
                        .padding(.vertical)
                        .multilineTextAlignment(.center)
                    
                    Text("Level : \(gameViewModel.currentLevel)")
                        .font(.system(.title2).bold())
                    
                    Text("\(gameViewModel.time)")
                        .font(.system(.title).bold())
                        .padding(.vertical, 12)
                        .frame(width: 150)
                        .foregroundColor(.primaryAccent)
                        .background(Color.primaryGray.opacity(0.2))
                        .cornerRadius(16)
                        .overlay{
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.primaryAccent)
                            
                        }
                        .padding()
                    
                    GridGameView { result in
                        if result{
                            gameViewModel.currentLevel = gameViewModel.currentLevel + 1
                        } else {
                            gameViewModel.addNewGame()
                            gameViewModel.reset()
                            gameViewModel.isShowResult = true
                            
                        }
                    }
                    .disabled(!gameViewModel.isActive)
                    .frame(height: screen.size.height / 2)
                    
                    
                    
                    if gameViewModel.isActive {
                        HStack {
                            Button {
                                withAnimation {
                                    isShowAlertRestart = true
                                }
                                
                            } label: {
                                Text("Restart")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryAccent)
                                    .foregroundColor(.primaryButtonLabel)
                                    .cornerRadius(16)
                            }
                            .alert("Are you sure to restart the game?", isPresented: $isShowAlertRestart) {
                                Button("Tidak", role: .cancel){
                                    isShowAlertRestart = false
                                }
                                
                                Button("Ya", role: .destructive){
                                    withAnimation {
                                        gameViewModel.reset()
                                    }
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    gameViewModel.addNewGame()
                                    gameViewModel.reset()
                                    gameViewModel.isShowResult = true
                                    
                                }
                                
                            } label: {
                                Text("Finish")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryAccent)
                                    .foregroundColor(.primaryButtonLabel)
                                    .cornerRadius(16)
                            }
                        }
                        .padding()
                    } else {
                        Button {
                            withAnimation {
                                gameViewModel.start(minutes: gameViewModel.minutes)
                            }
                            
                        } label: {
                            Text("Start")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.primaryAccent)
                                .foregroundColor(.primaryButtonLabel)
                                .cornerRadius(16)
                        }
                        .padding()
                    }
                }
                
                HalfASheet(isPresented: $gameViewModel.isShowResult) {
                    ResultScoreView(latestLevel: gameViewModel.latestLevelAchieved)
                }
                .height(.proportional(0.5))
                
            }
            .onReceive(timer) { _ in
                gameViewModel.updateCountdown()
            }
            .onAppear{
                gameViewModel.generateColor()
                gameViewModel.generateAnswer()
            }
        }
        
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
