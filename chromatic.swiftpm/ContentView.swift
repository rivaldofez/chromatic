import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onAppear {
//                    DatabaseManager.shared.saveNewUser(username: "rivaldo", fullname: "Rivaldo Fernandes", bio: "Ini Test")
//
//                    DatabaseManager.shared.saveNewUser(username: "axel", fullname: "Axelinus", bio: "Ini Axel")
                    
//                    DatabaseManager.shared.addNewGame(username: "rivaldo", level: 8)
//
//                    DatabaseManager.shared.addNewGame(username: "axel", level: 13)
                    
//                    print(DatabaseManager.shared.getUserData())
                    
                    print(DatabaseManager.shared.getGameData())
                    
                    
                }
        }
    }
}
