//
//  FavoritesView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//


import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: PetsViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                
                if viewModel.filteredFavoritePets.isEmpty {
                    
                    VStack(spacing: 12) {
                        Spacer()
                        
                        Image(systemName: "heart.slash.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray.opacity(0.4))
                        
                        Text("No favorites yet")
                            .font(.headline)
                            .fontWeight(.medium)
                        
                        Text("Tap the heart on a pet to save them here.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                
                } else {
                                        
                    VStack(alignment: .leading) {
                        Text("Your Favorites 🐾")
                            .font(.largeTitle).fontWeight(.bold)
                            .foregroundColor(.brandPrimary)
                        Text("The friends you've saved")
                            .font(.callout).foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.filteredFavoritePets) { pet in
                                NavigationLink(destination: PetDetailView(pet: pet)) {
                                    PetCard(pet: pet, onFavoriteToggle: {
                                        self.viewModel.toggleFavorite(for: pet)
                                    })
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
