//
//  HomeView.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        VStack {
            Text("Main screen")
            Button(action: {
                viewRouter.currentScreen = .game
            }) {
                Text("Go to Game")
            }
            Button(action: {
                viewRouter.currentScreen = .scoreboard
            }) {
                Text("Go to Scoreboard")
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
