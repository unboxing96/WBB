//
//  ScoreBoardView.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI

struct ScoreBoardView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var gameManager: GameManager

    var body: some View {
        VStack {
            Text("Scoreboard")
            List(gameManager.scores, id: \.self) { score in
                Text("Score: \(score)")
            }
            Button(action: {
                viewRouter.currentScreen = .home
            }) {
                Text("Go to Home")
            }
        }
    }
}


struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
    }
}
