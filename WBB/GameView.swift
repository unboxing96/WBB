//
//  GameView.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI
import Foundation

class GameManager: ObservableObject {
    @Published var scores: [Int] = []
    @Published var currentScore: Int = 0
    @Published var countdown: TimeInterval = 5
    @Published var gameIsActive: Bool = false
    @Published var gameIsFinished: Bool = false
    @Published var showModal = false

    private var timer: Timer?

    func startGame() {
        // Only start the game if it's not already in progress
        guard !gameIsActive else { return }

        currentScore = 0
        countdown = 5
        gameIsActive = true
        gameIsFinished = false
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            if self.countdown > 0 {
                self.countdown = max(0, self.countdown - 0.001)  // Prevent countdown from going below zero
            } else {
                self.endGame()
            }
        }
    }

    func endGame() {
        timer?.invalidate()
        gameIsActive = false
        gameIsFinished = true
        showModal = true
        scores.append(currentScore)
    }

    func resetGame() {
        timer?.invalidate()
        gameIsActive = false
        gameIsFinished = false
        showModal = false
        currentScore = 0 // reset current score
        countdown = 5
    }
}

struct GameView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var gameManager: GameManager
    @State private var showModal = false

    var body: some View {
        VStack {
            Text("Game screen")
            Text("Shake count: \(gameManager.currentScore)")
            Button(action: {
                self.gameManager.currentScore += 1
            }) {
                Text("Simulate a shake")
            }.disabled(!gameManager.gameIsActive)

            Button(action: {
                self.gameManager.startGame()
            }) {
                Text("Start game")
            }
            Text(String(format: "%.3f", gameManager.countdown))
        }
        .onReceive(gameManager.$gameIsFinished) { gameIsFinished in
            if gameIsFinished {
                gameManager.showModal = true
            }
        }
        .sheet(isPresented: $gameManager.showModal) {
            ScoreModalView()
                .environmentObject(viewRouter)
                .environmentObject(gameManager)
        }
        .onAppear {
            gameManager.currentScore = 0 // reset current score
            gameManager.countdown = 5
            gameManager.showModal = false
        }
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
