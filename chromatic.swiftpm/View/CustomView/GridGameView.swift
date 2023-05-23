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
    
    @Binding var numColumn: Int
    
    @State var numItems: Int
    var answer: Int
    @State var baseColor: Color
    @State var answerColor: Color
    
    @State private var columns: [GridItem]
    
    init(numColumn: Binding<Int>, answer: Int, baseColor: Color, answerColor: Color) {
        self._numColumn = numColumn
        self.numItems =  numColumn.wrappedValue * numColumn.wrappedValue
        self.answer = answer
        self.baseColor = baseColor
        self.answerColor = answerColor
        self.columns = Array(repeating: .init(.flexible()), count: numColumn.wrappedValue)
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
                    
                    print("In Grid Game View \(numColumn)")
                    print("In Grid Game View lent \(columns.count)")
                } label: {
                    Circle()
                        .foregroundColor(number == answer ? answerColor : baseColor)
                }
            }
        }
        .padding(.horizontal, 50)
        .onChange(of: numColumn) { _ in
            self.columns = Array(repeating: .init(.flexible()), count: numColumn)
            self.numItems = numColumn * numColumn
        }
    }
}

//struct GameGridItem_Previews: PreviewProvider {
//    static var previews: some View {
//        GridGameView(numColumn: .constant(10), answer: 20, baseColor: .red, answerColor: .blue)
//    }
//}
