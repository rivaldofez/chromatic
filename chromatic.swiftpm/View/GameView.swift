//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 22/05/23.
//

import Foundation
import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding()
                        .background(.gray.opacity(0.3))
                        .clipShape(Circle())
                }
                Spacer()
            }
            
            Text("Please \(Text("Choose").foregroundColor(Color.blue)) the \(Text("Different Color").foregroundColor(Color.blue))")
                .font(.system(.title2).bold())
                .padding(.vertical)
                .multilineTextAlignment(.center)
            
            Text("Level : 1")
                .font(.system(.title2).bold())
            
            Text("01:00")
                .font(.system(.title).bold())
                .padding()
                .background(.blue)
                .cornerRadius(16)
            
            
            GridGameView()
            
            
            HStack {
                Button {
                    
                } label: {
                    Text("Restart")
                }
                
                Button {
                    
                } label: {
                    Text("Finish")
                }

            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
