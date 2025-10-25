//
//  PetFinderView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI
import MapKit

struct PetFinderView: View {
    
    @EnvironmentObject var petsViewModel: PetsViewModel
        
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.8368, longitude: 14.3059),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    @State private var selectedPetID: Pets.ID?
    
    @State private var scrolledPetID: Pets.ID?
    
    @State private var isMapSelection: Bool = false

    var filteredPets: [Pets] {
        return petsViewModel.pets
    }
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { scrollProxy in
                ZStack {
                    VStack {
                        Spacer()
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach (filteredPets) { pet in
                                    PetCard(pet: pet, onFavoriteToggle: {
                                        petsViewModel.toggleFavorite(for: pet)
                                    })
                                        .padding()
                                        .background(.effectWhite)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(pet.id == selectedPetID ? Color(.brandPrimary) : Color.gray.opacity(0.1),
                                                        lineWidth: pet.id == selectedPetID ? 1 : 1)
                                        )
                                        .onTapGesture {
                                            selectPet(pet, moveMap: true)
                                        }
                                        .id(pet.id)
                                }
                            }
                            .padding(.horizontal)
                            .scrollTargetLayout()
                            
                        }
                        .padding(.bottom, 10)
                        .scrollIndicators(.hidden)
                        .scrollPosition(id: $scrolledPetID)
                        .scrollTargetBehavior(.viewAligned)
                        
                        .onChange(of: selectedPetID) { oldID, newID in
                            if let newID = newID, isMapSelection {
                                withAnimation {
                                    scrollProxy.scrollTo(newID, anchor: .center)
                                    scrolledPetID = newID
                                }
                            }
                        }
                        .onChange(of: scrolledPetID) { oldID, newID in
                            guard !isMapSelection else {
                                isMapSelection = false
                                return
                            }
                            
                            if let newID = newID,
                               let pet = filteredPets.first(where: { $0.id == newID }) {
                                selectPet(pet, moveMap: true)
                            }
                        }
                        
                    }
                    
                }
                .background {
                    Map(position: $cameraPosition, content: {
                        ForEach(filteredPets) { pet in
                            Annotation(pet.name, coordinate: pet.coordinate) {
                                PetMapAnnotationView(pet: pet,
                                                     isSelected: pet.id == selectedPetID)
                                    .onTapGesture {
                                        isMapSelection = true
                                        selectPet(pet, moveMap: false)
                                    }
                            }
                        }
                    })
                    .ignoresSafeArea()
                }
                .onAppear {
                    if let firstPet = petsViewModel.pets.first {
                        selectPet(firstPet, moveMap: true)
                        scrolledPetID = firstPet.id
                    }
                }
            }
        }
    }
    
    private func selectPet(_ pet: Pets, moveMap: Bool) {
        selectedPetID = pet.id
        
        if moveMap {
            withAnimation(.easeInOut(duration: 0.5)) {
                
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                
                let latitudeOffset = span.latitudeDelta * 0.3
                
                let newCenterCoordinate = CLLocationCoordinate2D(
                    latitude: pet.coordinate.latitude - latitudeOffset,
                    longitude: pet.coordinate.longitude
                )
                
                cameraPosition = .region(
                    MKCoordinateRegion(
                        center: newCenterCoordinate,
                        span: span
                    )
                )
            }
        }
    }
}

#Preview {
    PetFinderView()
}
