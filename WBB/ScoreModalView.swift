//
//  ScoreModalView.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI

struct ScoreModalView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var gameManager: GameManager
    @State private var buttonPressed = false

    var body: some View {
        VStack {
            Text("Score: \(gameManager.currentScore)")
            Button(action: {
                buttonPressed = true
                gameManager.resetGame()
                viewRouter.currentScreen = .game
            }) {
                Text("Play Again")
            }
            Button(action: {
                buttonPressed = true
                gameManager.showModal = false
                viewRouter.currentScreen = .scoreboard
            }) {
                Text("Go to Scoreboard")
            }
        }
        .onDisappear() {
            if !buttonPressed {
                gameManager.resetGame()
            }
            buttonPressed = false
        }
    }
}



//struct ScoreModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreModalView(score: 1, onDismiss: )
//    }
//}
