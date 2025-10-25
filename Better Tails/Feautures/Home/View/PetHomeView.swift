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
        
    @State private var isCyclingStages: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        HeaderView()
                        GreetingView()
                        
                        if let petToAdopt = petsViewModel.petInAdoption {
                                                    
                            CurrentAdoptionCard(
                                petName: petToAdopt.name,
                                petImage: petToAdopt.photo,
                                currentStage: petsViewModel.adoptionStage
                            )
                            .transition(.scale.combined(with: .opacity))
                            .onTapGesture {
                                guard !isCyclingStages else { return }
                                isCyclingStages = true
                                
                                Task {
                                    let allStages = AdoptionStage.allCases
                                    
                                    await MainActor.run {
                                        withAnimation { petsViewModel.adoptionStage = allStages[0] }
                                    }
                                    
                                    for stage in allStages.dropFirst() {
                                        try? await Task.sleep(nanoseconds: 500_000_000)
                                        
                                        await MainActor.run {
                                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 15)) {
                                                petsViewModel.adoptionStage = stage
                                            }
                                        }
                                    }
                                    
                                    try? await Task.sleep(nanoseconds: 5_000_000_000)
                                     
                                    await MainActor.run {
                                        withAnimation(.spring(duration: 0.4)) {
                                            petsViewModel.petInAdoption = nil
                                        }
                                        petsViewModel.adoptionStage = .applying
                                    }
                                    isCyclingStages = false
                                }
                            }
                        }
                        
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
                        
                        VStack(spacing: 12) {
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
        .environmentObject(PetsViewModel())
}
