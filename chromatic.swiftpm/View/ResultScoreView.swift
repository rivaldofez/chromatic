//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import SwiftUI

struct ResultScoreView: View {
    var body: some View {
        VStack {
            Text("Your Highest Level: \(10)")
                .font(.system(.title2))
            Text("Your Lowest Level : \(4)")
        }
    }
}

struct ResultScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ResultScoreView()
    }
}
