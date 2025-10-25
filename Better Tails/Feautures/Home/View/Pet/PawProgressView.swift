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
    
    let activeColor: Color
    let inactiveColor: Color
    
    var body: some View {
        HStack {
            ForEach(0..<totalSteps, id: \.self) { i in
                Image(systemName: "pawprint.fill")
                    .font(.caption)
                    .foregroundColor(i <= currentStepIndex ? activeColor : inactiveColor)
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
