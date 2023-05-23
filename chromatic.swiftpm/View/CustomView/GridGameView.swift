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
    
    var numColumn: Int
    var numItems: Int
    var answer: Int
    var baseColor: Color
    var answerColor: Color
    
    @State private var columns: [GridItem]
    
    init(numColumn: Int, answer: Int, baseColor: Color, answerColor: Color) {
        self.numColumn = numColumn
        self.numItems = numColumn * numColumn
        self.answer = answer
        self.baseColor = baseColor
        self.answerColor = answerColor
        self.columns = Array(repeating: .init(.flexible()), count: numColumn)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(1...self.numItems, id: \.self){ number in
                Button {
                    if(number == answer){
                        print("Benar")
                    } else {
                        print("Salah")
                    }
                } label: {
                    Circle()
                        .foregroundColor(number == answer ? answerColor : baseColor)
                }
            }
        }
        .padding(.horizontal, 50)
    }
}

struct GameGridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridGameView(numColumn: 10, answer: 50, baseColor: .red, answerColor: .blue)
    }
}
