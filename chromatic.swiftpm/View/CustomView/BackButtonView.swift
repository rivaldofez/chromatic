//
//  File.swift
//  
//
//  Created by Rivaldo Fernandes on 23/05/23.
//

import SwiftUI

struct BackButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding()
                .foregroundColor(.primaryAccent)
                .background(Color.primaryGray.opacity(0.2))
                .clipShape(Circle())
        }
        .hLeading()
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(action: {})
    }
}
