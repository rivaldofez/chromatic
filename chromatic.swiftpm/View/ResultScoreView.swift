//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import SwiftUI

struct ResultScoreView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var latestLevel: Int
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "gamecontroller.fill")
                    .font(.system(.title))
                    .foregroundColor(.red)
                Text("Game Over")
                    .font(.system(.title))
                    .foregroundColor(.red)
                    .bold()
            }
            
            Divider()
                .padding(.vertical)
            
            
            Text("You Got Level : \(latestLevel)")
                .font(.system(.title2).bold())
                .foregroundColor(.primaryAccentLabel)
                .padding(.top, 8)
            
            
            Text("Your Highest Level : \(gameViewModel.highestLevelAchieved)")
                .font(.system(.title3).bold())
                .foregroundColor(.darkGold)
                .padding(.top, 8)
            
            Spacer()
        }
        .onAppear {
            gameViewModel.getHighestLevel()
        }
    }
    
}

struct ResultScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ResultScoreView(latestLevel: 10)
            .environmentObject(GameViewModel())
    }
}
