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
                        .frame(width: 30, height: 30)
                        .padding()
                        .background(.gray.opacity(0.3))
                        .clipShape(Circle())
                }
                Spacer()
            }
            
            Group {
                Text("Please")
                    .font(.system(.title).bold())
                +
                Text(" Choose")
                    .font(.system(.title).bold())
                    .foregroundColor(.blue)
                +
                Text(" the")
                    .font(.system(.title).bold())
                +
                Text(" Different Color")
                    .font(.system(.title).bold())
                    .foregroundColor(.blue)
            }
            
            Text("Level : 1")
                .font(.system(.title).bold())
            
            Text("01:00")
                .font(.system(.title).bold())
                .padding()
                .background(.blue)
                .cornerRadius(16)
            
            Spacer()
            
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
