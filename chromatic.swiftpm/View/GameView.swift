//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 22/05/23.
//

import Foundation
import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    @State var columnNum = 3
    var body: some View {
        VStack {
            
            BackButtonView {
                print("Clicked Back")
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
                .padding(.horizontal, 32)
                .foregroundColor(.primaryAccent)
                .background(.gray.opacity(0.2))
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
                    gameViewModel.reset()
                }
            }
            .disabled(!gameViewModel.isActive)
                .frame(maxHeight: .infinity)
            
            Spacer()
            
            if gameViewModel.isActive {
                HStack {
                    Button {
                        gameViewModel.reset()
                    
                    } label: {
                        Text("Restart")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryAccentLabel)
                            .cornerRadius(16)
                    }
                    
                    Button {
                        gameViewModel.reset()
                        
                    } label: {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryAccentLabel)
                            .cornerRadius(16)
                    }
                }
                .padding()
            } else {
                Button {
                    gameViewModel.start(minutes: gameViewModel.minutes)
                } label: {
                    Text("Start")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccentLabel)
                        .cornerRadius(16)
                }
                .padding()
            }
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
