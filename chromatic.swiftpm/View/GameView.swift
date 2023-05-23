//
//  File.swift
//
//
//  Created by Rivaldo Fernandes on 22/05/23.
//

import Foundation
import SwiftUI

struct GameView: View {
    @StateObject private var vm = GameViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    @State var columnNum = 3
    var body: some View {
        VStack {
            
            BackButtonView {
                print("Clicked Back")
            }
            .padding(.leading)
            
            Text("Please \(Text("Choose").foregroundColor(.primaryAccentLabel)) the \(Text("Different Color").foregroundColor(.primaryAccentLabel))")
                .font(.system(.title2).bold())
                .padding(.vertical)
                .multilineTextAlignment(.center)
            
            Text("Level : 1")
                .font(.system(.title2).bold())
            
            Text("\(vm.time)")
                .font(.system(.title).bold())
                .padding(.vertical, 12)
                .padding(.horizontal, 32)
                .foregroundColor(.primaryAccent)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primaryAccent)

                }
                .padding()
                
            GridGameView(numColumn: $vm.currentColumnNum, answer: vm.currentAnswer, baseColor: vm.currentBaseColor, answerColor: vm.currentAnswerColor) { result in
                print(result)
                
            }
                .frame(maxHeight: .infinity)
            
            Spacer()
            
            if vm.isActive {
                HStack {
                    Button {
                        columnNum = columnNum + 1
                        print(columnNum)
                    } label: {
                        Text("Restart")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryAccentLabel)
                            .cornerRadius(16)
                    }
                    
                    Button {
                        vm.reset()
                        
                    } label: {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryAccentLabel)
                            .cornerRadius(16)
                    }
                }
                .padding()
            } else {
                Button {
                    vm.start(minutes: vm.minutes)
                } label: {
                    Text("Start")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryAccentLabel)
                        .cornerRadius(16)
                }
                .padding()
            }
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
        .onAppear{
            vm.generateColor()
            vm.generateAnswer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
