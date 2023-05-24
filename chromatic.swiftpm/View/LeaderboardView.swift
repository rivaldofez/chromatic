//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 24/05/23.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            BackButtonView {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading)
            
            Text("Leaderboard")
                .font(.system(.title).bold())
                .padding(.bottom)
            
            if(gameViewModel.leaderboards.isEmpty) {
                Spacer()
                emptyMessage
            } else {
                ScrollView {
                    ForEach(0..<gameViewModel.leaderboards.count, id: \.self){ idx in
                        
                        LeaderboardItemView(rank: idx + 1, level: gameViewModel.leaderboards[idx].level, username: gameViewModel.leaderboards[idx].username)
                        
                    }
                    .padding()
                }
            }
            Spacer()
        }
        .onAppear {
            gameViewModel.getGameData()
        }
    }
    
    var emptyMessage: some View {
        Text("No data record yet. Play first to fill these leaderboard")
            .foregroundColor(.primaryAccentLabel)
            .font(.system(.title2))
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(GameViewModel())
    }
}
