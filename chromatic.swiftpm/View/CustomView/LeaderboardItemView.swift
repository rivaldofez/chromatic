//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 24/05/23.
//

import SwiftUI

struct LeaderboardItemView: View {
    var rank: Int
    var level : Int
    var username: String
    
    var body: some View {
        HStack(spacing: 0) {
            RankTextView(rank: rank)
            
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(10)
                .background(Color.primaryAccentLabel)
                .clipShape(Circle())
                .padding(.leading)
            
            Text(username)
                .font(.system(.body))
                .foregroundColor(.primaryLabel)
                .padding(.horizontal)
                .lineLimit(2)
            
            Spacer()
            
            Divider()
            
            Text("Lv.\(level)")
                .frame(width: 40, height: 30)
                .font(.system(.body))
                .foregroundColor(.primaryLabel)
                .padding()
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    
    func RankTextView(rank: Int) -> some View {
        return Text("\(rank)")
            .font(.system(size: 11).weight(.light))
            .foregroundColor(
                rank == 1 ? .yellow :
                    (rank == 2 ? .gray :
                        (rank == 3 ? .brown : .primaryLabel)
                    )
            )
            .frame(width: 30, height: 30)
            .background(
                Circle()
                    .fill(
                        rank == 1 ? .yellow.opacity(0.5) :
                            (rank == 2 ? .gray.opacity(0.5) :
                                (rank == 3 ? .brown.opacity(0.5) : .gray.opacity(0.1))
                            )
                    )
            )
            .padding(20)
            
            .background(.gray.opacity(0.1))
            .cornerRadius(16, corners: [.topLeft, .bottomLeft])
    }
}

struct LeaderboardItemView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardItemView(rank: 1, level: 40, username: "Rivaldo")
    }
}
