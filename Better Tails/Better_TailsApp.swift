//
//  Better_TailsApp.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

@main
struct Better_TailsApp: App {
    @State private var isSplashActive = true
    
    var body: some Scene {
        WindowGroup {
            if isSplashActive {
                SplashView(isActive: $isSplashActive)
            } else {
                ContentView()
            }
        }
    }
}
