//
//  PetFinderView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct PetFinderMatchView: View {
    @EnvironmentObject var viewModel: PetsViewModel
    @State private var showFavoriteHeart: Bool = false
    @State private var petStack: [Pets] = []
    @State private var offset = CGSize.zero
    @State private var isFlipped = false

    var body: some View {
        NavigationStack {
            ZStack {
                if petStack.isEmpty {
                    Text("No more pets available. 😿")
                        .font(.headline)
                        .foregroundColor(.secondary)
                } else {
                    ZStack {
                        if petStack.count > 1 {
                            let index = petStack.count - 2
                            if petStack.indices.contains(index) {
                                PetCardFrontView(pet: petStack[index])
                            }
                        }
                        if let lastPet = petStack.last {
                            FlippableCard(pet: lastPet)
                        }
                        
                        Image(systemName: "heart.fill")
                            .font(.system(size: 150, weight: .bold))
                            .foregroundColor(.red.opacity(0.8))
                            .scaleEffect(showFavoriteHeart ? 1.0 : 0.1)
                            .opacity(showFavoriteHeart ? 1.0 : 0.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: showFavoriteHeart)
                            .allowsHitTesting(false)
                    }
                }
            }
            .onAppear {
                if petStack.isEmpty {
                    petStack = viewModel.pets
                }
            }
        }
    }
    

    @ViewBuilder
    private func FlippableCard(pet: Pets) -> some View {
        ZStack {
            
            PetCardFrontView(pet: pet)
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .opacity(isFlipped ? 0 : 1)

            PetCardBackView(pet: pet)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .opacity(isFlipped ? 1 : 0)
        }
        .frame(width: 350, height: 600)
        .padding(20)
        .offset(x: offset.width)
        .rotationEffect(Angle(degrees: offset.width / 20.0))
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                isFlipped.toggle()
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if !isFlipped {
                        offset = gesture.translation
                    }
                }
                .onEnded { gesture in
                    if isFlipped { return }
                    
                    let swipeWidth = gesture.translation.width
                    
                    if swipeWidth > 150 {
                        handleSwipe(pet: pet, direction: .right)
                    } else if swipeWidth < -150 {
                        handleSwipe(pet: pet, direction: .left)
                    } else {
                        withAnimation(.spring) {
                            offset = .zero
                        }
                    }
                }
        )
    }
        
    func handleSwipe(pet: Pets, direction: SwipeDirection) {
            if direction == .right {
                if !pet.favorite {
                    viewModel.toggleFavorite(for: pet)
                }
                showFavoriteHeart = true
            }
            
            let slideOffDuration = 0.5
        
            offset.width = (direction == .right ? 1000 : -1000)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + slideOffDuration) {
                petStack.removeLast()
                offset = .zero
                isFlipped = false
                showFavoriteHeart = false
            }
        }
    
    enum SwipeDirection {
        case left, right
    }
}
