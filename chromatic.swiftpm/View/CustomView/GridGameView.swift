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
    
    
    
    
    var numColumn = 10
    
    @State private var columns: [GridItem]
    
    init(numColumn: Int = 10) {
        self.numColumn = numColumn
        self.columns = Array(repeating: .init(.flexible()), count: numColumn)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(1...100, id: \.self){ number in
                
                Button {
                    print("clicked at \(number)")
                } label: {
                    Circle()
                }
            }
        }
        .padding(.horizontal, 50)
    }
}

struct GameGridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridGameView()
    }
}
