//
//  ViewRouter.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import Foundation
import SwiftUI
import Combine

class ViewRouter: ObservableObject {
    @Published var currentScreen: Screen = .home

    enum Screen {
        case home
        case game
        case scoreboard
    }
}
