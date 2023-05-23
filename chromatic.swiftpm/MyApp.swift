import SwiftUI

@main
struct MyApp: App {
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(gameViewModel)
        }
    }
}
