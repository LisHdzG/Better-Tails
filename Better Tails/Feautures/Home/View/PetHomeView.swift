//
//  PetHomeView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct PetHomeView: View {
    @EnvironmentObject var petsViewModel: PetsViewModel
    var servicesViewModel: ServicesViewModel = ServicesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemBackground)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        HeaderView()
                        GreetingView()
                        CurrentAdoptionCard(petName: "Max",
                                            petImage: "current-dog",
                                            currentStage: .applying)
                        
                        ///Services
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Pet Services")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            ScrollView(.horizontal) {
                                ForEach (servicesViewModel.services) { services in
                                    ServiceButton(service: services)
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Pet Nears You")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                NavigationLink(destination:
                                                PetFinderView()) {
                                    Text("View All")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.horizontal)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 16) {
                                    ForEach (petsViewModel.pets) { pet in
                                        NavigationLink(destination: PetDetailView(pet: pet)) {
                                            PetCard(pet: pet, onFavoriteToggle: {
                                                self.petsViewModel.toggleFavorite(for: pet)
                                            })
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .scrollIndicators(.hidden)
                        }
                        
                        ///What can I do if I can't adopt?
                        HelpBannerView()
                    }
                    .padding()
                    .padding(.bottom, 120)
                }
                .scrollIndicators(.hidden)

            }
        }
    }
}

#Preview {
    PetHomeView()
}
