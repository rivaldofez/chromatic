//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import Foundation

import Foundation
import SwiftUI

struct GridGameView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @State private var columns: [GridItem] = []
    
    var action: (_ resultAnswer: Bool) -> Void
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(1...gameViewModel.currentItemsNum, id: \.self){ number in
                Button {
                    action(number == gameViewModel.currentAnswer)
                } label: {
                    
                    if gameViewModel.currentShapeStyle == "circle" {
                        Circle()
                            .foregroundColor(number == gameViewModel.currentAnswer ? gameViewModel.currentAnswerColor : gameViewModel.currentBaseColor)
                    } else {
                        Circle()
                            .overlay{
                                Rectangle()
                                    .foregroundColor(number == gameViewModel.currentAnswer ? gameViewModel.currentAnswerColor : gameViewModel.currentBaseColor)
                            }
                        
                    }
                    
                    
                }
            }
        }
        .padding(.horizontal, 50)
        .onChange(of: gameViewModel.currentColumnNum) { newColumn in
            self.columns = Array(repeating: .init(.flexible()), count: newColumn)
        }
        .onAppear {
            self.columns = Array(repeating: .init(.flexible()), count: gameViewModel.currentColumnNum)
        }
    }
}

struct GameGridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridGameView { resultAnswer in
            
        }.environmentObject(GameViewModel())
    }
}
