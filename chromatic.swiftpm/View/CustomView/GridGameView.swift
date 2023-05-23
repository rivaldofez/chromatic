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
    
    var action: (_ resultAnswer: Bool) -> Void
    
    init(numColumn: Binding<Int>, answer: Int, baseColor: Color, answerColor: Color, action: @escaping (_ resultAnswer: Bool) -> Void) {
        self._numColumn = numColumn
        self.numItems =  numColumn.wrappedValue * numColumn.wrappedValue
        self.answer = answer
        self.baseColor = baseColor
        self.answerColor = answerColor
        self.columns = Array(repeating: .init(.flexible()), count: numColumn.wrappedValue)
        self.action = action
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(1...self.numItems, id: \.self){ number in
                Button {
                    action(number == answer)
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

struct GameGridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridGameView(numColumn: .constant(10), answer: 20, baseColor: .red, answerColor: .blue, action: { result in
            
        })
    }
}
