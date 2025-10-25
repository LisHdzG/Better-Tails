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
    
    private var currentStepIndex: Int {
        AdoptionStage.allCases.firstIndex(of: currentStage) ?? 0
    }
    
    private var totalSteps: Int {
        AdoptionStage.allCases.count
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
                
                Text("Current step: \(currentStage.rawValue)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                PawProgressView(
                    totalSteps: totalSteps,
                    currentStepIndex: currentStepIndex
                )
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CurrentAdoptionCard(petName: "Max",
                        petImage: "current-dog",
                        currentStage: .applying)
}
