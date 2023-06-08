//
//  ContentView.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentScreen {
        case .home:
            HomeView()
        case .game:
            GameView()
        case .scoreboard:
            ScoreBoardView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
