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
            
            Text("App Settings")
                .font(.system(.title).bold())
                .padding(.bottom)
            
            ScrollView {
                ForEach(0..<gameViewModel.leaderboards.count, id: \.self){ idx in
                    
                    LeaderboardItemView(rank: idx + 1, level: gameViewModel.leaderboards[idx].level, username: gameViewModel.leaderboards[idx].username)
                    
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .onAppear {
            gameViewModel.getGameData()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(GameViewModel())
    }
}
