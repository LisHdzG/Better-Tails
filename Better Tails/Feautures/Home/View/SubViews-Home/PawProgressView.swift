//
//  PawProgressView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI

struct PawProgressView: View {
    let totalSteps: Int
    let currentStepIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<totalSteps, id: \.self) { index in
                Image(systemName: index <= currentStepIndex ? "pawprint.fill" : "pawprint")
                    .font(.body)
                    .foregroundColor(index <= currentStepIndex ? .brandPrimary : Color(.systemGray4))
            }
        }
        .padding(.vertical, 1)
    }
}

#Preview {
    CurrentAdoptionCard(petName: "Max",
                        petImage: "current-dog",
                        currentStage: .applying)
}
