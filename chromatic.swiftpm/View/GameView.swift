//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 22/05/23.
//

import Foundation
import SwiftUI

struct GameView: View {
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
            
            Text("Level : 1")
                .font(.system(.title2).bold())
            
            Text("01:00")
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
                
            GridGameView(numColumn: $columnNum, answer: 40, baseColor: .red, answerColor: .blue)
                .frame(maxHeight: .infinity)


            Spacer()
            
            HStack {
                Button {
                    columnNum = columnNum + 1
                    print(columnNum)
                } label: {
                    Text("Restart")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccentLabel)
                        .cornerRadius(16)
                }
                
                Button {
                } label: {
                    Text("Finish")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccentLabel)
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
