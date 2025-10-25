//
//  AdoptionSuccessView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//

import SwiftUI

struct AdoptionSuccessView: View {
     
    let pet: Pets
     
    @State private var isAnimating = false
    @EnvironmentObject var petsViewModel: PetsViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color(.brandPrimary)
                .ignoresSafeArea()
           
            ZStack {
                ForEach(0..<40) { _ in
                    Circle()
                        .fill(.white)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: isAnimating ? (Double.random(in: -1...1) * 250) : 0,
                            y: isAnimating ? (Double.random(in: -1...1) * 350) : 0
                        )
                        .opacity(isAnimating ? 0 : 1)
                        .animation(
                            .easeOut(duration: 1.5).delay(Double.random(in: 0...0.2)),
                            value: isAnimating
                        )
                }
            }
           
            VStack(spacing: 20) {
                
                Spacer()
                
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white.opacity(0.9))
                
                Text("You have a new friend!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
               
                Image(pet.photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 220)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .shadow(radius: 10)
               
                Text(pet.name)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
               
                Text("Your adoption process has started!")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.9))
                    .scaleEffect(isAnimating ? 1 : 0.3)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(
                        .interpolatingSpring(stiffness: 100, damping: 10).delay(0.7),
                        value: isAnimating
                    )

                Text("We'll be in touch soon. ❤️")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
                
                Spacer()
                
                
            }
            .scaleEffect(isAnimating ? 1 : 0.3)
            .opacity(isAnimating ? 1 : 0)
            .animation(
                .interpolatingSpring(stiffness: 120, damping: 12).delay(0.2),
                value: isAnimating
            )
           
        }
        .onAppear {
            isAnimating = true
            petsViewModel.startAdoptionProcess(pet: pet)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation(.easeIn(duration: 0.5)) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
