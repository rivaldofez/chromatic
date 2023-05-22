import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onAppear {
//                    DatabaseManager.shared.saveNewUser(username: "rivaldo", fullname: "Rivaldo Fernandes", bio: "Ini nyoba pertama")
                    DatabaseManager.shared.addNewGame(username: "rivaldo", level: 10)
                    
                    print(DatabaseManager.shared.getUserData())
                }
        }
    }
}
