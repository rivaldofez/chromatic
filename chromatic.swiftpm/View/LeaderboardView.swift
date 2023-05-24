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
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
