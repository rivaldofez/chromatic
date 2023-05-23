//
//  HomeView.swift
//
//
//  Created by Rivaldo Fernandes on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var username: String = ""
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    private let colorItems: [Color] = [.primaryAccent, .primaryAccent, .primaryAccent, .secondaryAccent]
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<colorItems.count, id: \.self){ index in
                    Circle()
                        .foregroundColor(colorItems[index])
                }
            }
            .frame(width: 200)
            
            Text("Are u ready to take the quiz?")
                .font(.system(.title2).bold())
                .foregroundColor(.primaryAccentLabel)
                .hLeading()
                .padding(.top, 42)
            
            Text("Challenge Your \(Text("Color Perception").foregroundColor(.primaryAccentLabel)) with Chromatic!")
                .foregroundColor(.primaryLabel)
                .font(.system(.footnote))
                .hLeading()
                .padding(.top, 8)
            
            TextField("Username", text: self.$username)
                .padding(12)
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primaryAccent)
                }
                .font(.system(.title3))
                .padding(.top, 24)
            
            Button {
                
            } label: {
                Text("Start")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryAccent)
                    .foregroundColor(.primaryButtonLabel)
                    .cornerRadius(16)
                    .font(.system(.body).bold())
            }
            .padding(.top, 24)
            
            HStack {
                Button {
                    
                } label: {
                    Text("Settings")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccent)
                        .foregroundColor(.primaryButtonLabel)
                        .cornerRadius(16)
                        .font(.system(.body).bold())
                }
                
                Button {
                    
                } label: {
                    Text("Leaderboard")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccent)
                        .foregroundColor(.primaryButtonLabel)
                        .cornerRadius(16)
                        .font(.system(.body).bold())
                }


            }
            .padding(.top, 24)

        }
        .padding(.horizontal)
        .onAppear {

        }
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
