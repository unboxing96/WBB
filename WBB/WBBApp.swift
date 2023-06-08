//
//  WBBApp.swift
//  WBB
//
//  Created by kimpepe on 2023/06/08.
//

import SwiftUI

@main
struct YourAppName: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var gameManager = GameManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
                .environmentObject(gameManager)
        }
    }
}
