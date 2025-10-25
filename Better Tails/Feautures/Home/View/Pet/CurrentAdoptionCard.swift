//
//  CurrentAdoptionCard.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

enum AdoptionStage: String, CaseIterable {
    case applying = "Applying"
    case approved = "Approved"
    case preparing = "Preparing"
    case readyForPickup = "Ready for Pickup"
}

struct CurrentAdoptionCard: View {
    let petName: String
    let petImage: String
    let currentStage: AdoptionStage
    @State private var isConfettiAnimating: Bool = false
    
    private var currentStepIndex: Int {
        AdoptionStage.allCases.firstIndex(of: currentStage) ?? 0
    }
    
    private var totalSteps: Int {
        AdoptionStage.allCases.count
    }
    
    private var cardBackgroundColor: Color {
        currentStage == .readyForPickup ? .brandPrimary : Color(.systemGray6)
    }
    
    private var primaryTextColor: Color {
        currentStage == .readyForPickup ? .white : .primary
    }
    
    private var secondaryTextColor: Color {
        currentStage == .readyForPickup ? .white : .secondary
    }
    
    private var activePawColor: Color {
        currentStage == .readyForPickup ? .white : .brandPrimary
    }

    private var inactivePawColor: Color {
        currentStage == .readyForPickup ? .white.opacity(0.5) : Color(.systemGray4)
    }
    
    var mainMessage: String {
        switch currentStage {
        case .applying:
            return "We're reviewing your application for \(petName)!"
        case .approved:
            return "Great news! Your application for \(petName) is approved!"
        case .preparing:
            return "We're getting everything ready for \(petName)!"
        case .readyForPickup:
            return "Almost there! \(petName) is ready to meet you!"
        }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(0..<40) { _ in
                    Circle()
                        .fill(Color.white)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: isConfettiAnimating ? (Double.random(in: -1...1) * 250) : 0,
                            y: isConfettiAnimating ? (Double.random(in: -1...1) * 350) : 0
                        )
                        .opacity(isConfettiAnimating ? 0 : 1) // Esta es la animación de "fade out"
                        .animation(
                            .easeOut(duration: 1.5).delay(Double.random(in: 0...0.2)),
                            value: isConfettiAnimating
                        )
                }
            }
            .allowsHitTesting(false)
            .opacity(isConfettiAnimating ? 1 : 0)

            
            HStack(spacing: 15) {
                Image(petImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .tint(.brandPrimary)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.green)
                    .frame(width: 70, height: 70)
                    .background(.brandPrimary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                 
                VStack(alignment: .leading, spacing: 8) {
                    Text(mainMessage)
                        .font(.body)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(primaryTextColor)
                       
                    Text("Current step: \(currentStage.rawValue)")
                        .font(.caption)
                        .foregroundColor(secondaryTextColor)
                       
                    PawProgressView(
                        totalSteps: totalSteps,
                        currentStepIndex: currentStepIndex,
                        activeColor: activePawColor,
                        inactiveColor: inactivePawColor
                    )
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .onChange(of: currentStage) { _, newStage in
            if newStage == .readyForPickup {
                isConfettiAnimating = true
                 
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isConfettiAnimating = false
                }
            }
        }
    }
}

#Preview {
    CurrentAdoptionCard(petName: "Max",
                        petImage: "current-dog",
                        currentStage: .applying)
}
