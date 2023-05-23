//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 21/05/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("App Settings")
                .font(.system(.title).bold())
            
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding(12)
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(Circle())
            
            Text("Hi, Audrina")
                .font(.system(.title2))
                .padding()
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Shapes")
                    .font(.system(.title3).bold())
                    .padding()
                
                Divider()
                
                HStack {
                    Rectangle()
                        .frame(width:
                         50, height: 50)
                    Text("Rectangle")
                        .font(.system(.title3))
                        .padding(.leading, 16)
                }.padding()
                
                Divider()
                
                HStack {
                    Circle()
                        .frame(width:
                         50, height: 50)
                    Text("Rectangle")
                        .font(.system(.title3))
                        .padding(.leading, 16)
                }
                .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal, 40)
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Background Scheme")
                    .font(.system(.title3).bold())
                    .padding()
                
                Divider()
                
                HStack {
                    Image(systemName: "sun.max")
                        .resizable()
                        .frame(width:
                         50, height: 50)
                    Text("Rectangle")
                        .font(.system(.title3))
                        .padding(.leading, 16)
                }.padding()
                
                Divider()
                
                HStack {
                    Image(systemName: "moon")
                        .resizable()
                        .frame(width:
                         50, height: 50)
                    Text("Rectangle")
                        .font(.system(.title3))
                        .padding(.leading, 16)
                }
                .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal, 40)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
