//
//  HomeView.swift
//
//
//  Created by Rivaldo Fernandes on 21/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @State var username: String = ""
    @State var alertErrorMessage: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    @State var isShowGameView: Bool = false
    @State var isShowSettingsView: Bool = false
    @State var isShowLeaderboardView: Bool = false
    @State var isShowAlert: Bool = false
    
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
                if(validateForm()){
                    showAlert(isActive: true, message: "Field cannot be empty, please complete all field and try again!")
                } else {
                    gameViewModel.saveNewUser(username: username) { result in
                        switch(result) {
                        case .success():
                            isShowGameView = true
                        case .failure(_):
                            showAlert(isActive: true, message: "Error occured while attempt user with that username, please try again.")
                        }
                    }
                }
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
            .alert(alertErrorMessage, isPresented: $isShowAlert) {
                Button("OK", role: .cancel){
                    isShowAlert = false
                }
            }
            
            HStack {
                Button {
                    isShowSettingsView = true
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
                    isShowLeaderboardView = true
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
        .fullScreenCover(isPresented: $isShowGameView, content: {
            GameView()
        })
        .fullScreenCover(isPresented: $isShowSettingsView, content: {
            SettingsView()
        })
        .fullScreenCover(isPresented: $isShowLeaderboardView, content: {
            LeaderboardView()
        })
        .padding(.horizontal)
        .onAppear {
            
        }

    }
    
    
    func validateForm() -> Bool {
        return username.isEmpty
    }
    
    func showAlert(isActive: Bool, message: String){
        isShowAlert = isActive
        self.alertErrorMessage = message
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
