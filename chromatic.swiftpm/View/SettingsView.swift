//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 21/05/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            
            BackButtonView {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.leading)
            
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
                    .foregroundColor(.primaryAccentLabel)
                
                Divider()
                
                Button {
                    withAnimation {
                        gameViewModel.setShapeStyle(shape: "rectangle")
                    }
                } label: {
                    HStack {
                        Rectangle()
                            .frame(width:
                                    40, height: 40)
                            .foregroundColor(Color.primaryAccentLabel)
                        Text("Rectangle")
                            .font(.system(.title3).weight(.medium))
                            .padding(.leading, 16)
                            .foregroundColor(.primaryLabel)
                        
                        Spacer()
                        
                        if(gameViewModel.currentShapeStyle == "rectangle"){
                            Image(systemName: "checkmark")
                                .font(.system(.title3).weight(.bold))
                                .foregroundColor(.primaryAccentLabel)
                                .padding(.horizontal)
                        }
                        
                        
                    }.padding()
                }
                
                
                Divider()
                
                Button {
                    withAnimation {
                        gameViewModel.setShapeStyle(shape: "circle")
                    }
                } label: {
                    HStack {
                        Circle()
                            .frame(width:
                                    40, height: 40)
                            .foregroundColor(Color.primaryAccent)
                        Text("Circle")
                            .font(.system(.title3).weight(.medium))
                            .padding(.leading, 16)
                            .foregroundColor(.primaryLabel)
                        
                        Spacer()
                        
                        if(gameViewModel.currentShapeStyle == "circle"){
                            Image(systemName: "checkmark")
                                .font(.system(.title3).weight(.bold))
                                .foregroundColor(.primaryAccentLabel)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                
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
                    .foregroundColor(.primaryAccentLabel)
                
                Divider()
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "sun.max")
                            .resizable()
                            .frame(width:
                                    40, height: 40)
                            .foregroundColor(.primaryLabel)
                        Text("Light Mode")
                            .font(.system(.title3).weight(.medium))
                            .padding(.leading, 16)
                            .foregroundColor(.primaryLabel)
                    }.padding()
                }
                
                
                Divider()
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "moon")
                            .resizable()
                            .frame(width:
                                    40, height: 40)
                            .foregroundColor(.primaryLabel)
                        Text("Dark Mode")
                            .font(.system(.title3).weight(.medium))
                            .padding(.leading, 16)
                            .foregroundColor(.primaryLabel)
                    }
                    .padding()
                }
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal, 40)
        }
        .onAppear {
            gameViewModel.getShapeStyle()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
