//
//  ContentView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI
import SwiftUI

import SwiftUI

enum Tabs {
    case home
    case favoritePets
    case profile
    case matchMe
}
struct ContentView: View {
    @State private var selectedTab: Tabs = .home
    @StateObject var petsViewModel: PetsViewModel = PetsViewModel()
    
    var body: some View {
       TabView (selection: $selectedTab) {
           Tab("Home", systemImage: "house", value: .home) {
              PetHomeView()
           }
           Tab("Pets", systemImage: "heart", value: .favoritePets) {
               FavoritesView()
           }
           Tab("Profile", systemImage: "person", value: .profile) {
               ProfileView()
           }
           Tab("Match met", systemImage: "pawprint", value: .matchMe, role: .search) {
               NavigationStack {
                   SuggestionView()
               }
           }
        }
       .tint(.brandPrimary)
       .environmentObject(petsViewModel)
    }
}

#Preview {
    ContentView()
}
