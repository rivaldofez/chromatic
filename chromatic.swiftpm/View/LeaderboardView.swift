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
            
            ScrollView {
                ForEach(1...100, id: \.self){ num in
                    HStack {
                        Text("\(num)")
                            .font(.system(size: 11).weight(.light))
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray)
                            )
                            .padding(20)
                            .background(Color.primaryAccent)
                        
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .clipShape(Circle())
                        
                        Text("Rivaldo Fernandes")
                            .font(.system(.body))
                            .foregroundColor(.primaryLabel)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Divider()
                        
                        Text("Lv.1")
                            .font(.system(.body))
                            .foregroundColor(.primaryLabel)
                            .padding(.horizontal)
                        
                        
                        
                    }
                    .cornerRadius(16)
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(GameViewModel())
    }
}
