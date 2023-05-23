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
    
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(1...4, id: \.self){ number in
                    Circle()
                }
            }
            .padding(.horizontal, 50)
            
            
            
            Text("Are u ready to take the quiz?")
            Text("Challenge Your Color Perception with Chromatic!")
            
            TextField("Username", text: self.$username)
            
            Button {
                
            } label: {
                Text("Start")
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("Settings")
                }
                
                Button {
                    
                } label: {
                    Text("Leader Board")
                }


            }

        }
        .onAppear {
            
            print("woiuu")
            
//            print(CoreDataManager.shared.getUsers())
            CoreDataManager.shared.registerUser(username: "rivaldo", name: "Rivaldo Fernandes")
            
            
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
