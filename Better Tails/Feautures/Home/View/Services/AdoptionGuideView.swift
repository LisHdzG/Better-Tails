//
//  AdoptionGuideView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct AdoptionGuideRow: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(iconColor)
                .frame(width: 30, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct AdoptionGuideView: View {
    var body: some View {
        List {
            Section("Before You Adopt 🤔") {
                AdoptionGuideRow(
                    iconName: "checklist",
                    iconColor: .blue,
                    title: "Assess Your Lifestyle",
                    description: "Consider your activity level, home size, and time commitment. Match the pet's needs to your life."
                )
                AdoptionGuideRow(
                    iconName: "dollarsign.circle.fill",
                    iconColor: .green,
                    title: "Budget Accordingly",
                    description: "Factor in costs for food, vet visits, grooming, toys, and potential emergencies."
                )
                AdoptionGuideRow(
                    iconName: "house.fill",
                    iconColor: .orange,
                    title: "Prepare Your Home",
                    description: "Pet-proof your space and gather essential supplies like bowls, a bed, collar/harness, leash, and toys."
                )
            }
            
            Section("The Adoption Process 📝") {
                AdoptionGuideRow(
                    iconName: "magnifyingglass",
                    iconColor: .purple,
                    title: "Find a Pet",
                    description: "Visit local shelters or rescue organizations like ours! Look online but always plan to meet in person."
                )
                AdoptionGuideRow(
                    iconName: "questionmark.circle.fill",
                    iconColor: .teal,
                    title: "Ask Questions",
                    description: "Inquire about the pet's history, health, temperament, and any known behavioral issues."
                )
                AdoptionGuideRow(
                    iconName: "doc.text.fill",
                    iconColor: .gray,
                    title: "Complete Paperwork",
                    description: "Be prepared for an application, interview, potential home visit, and adoption fees."
                )
            }
            
            Section("Bringing Your Pet Home ❤️") {
                AdoptionGuideRow(
                    iconName: "pawprint.fill",
                    iconColor: .brandPrimary,
                    title: "Be Patient",
                    description: "Allow your new pet time to adjust. It might take days or weeks for them to feel comfortable."
                )
                AdoptionGuideRow(
                    iconName: "figure.walk",
                    iconColor: .indigo,
                    title: "Establish a Routine",
                    description: "Consistent feeding times, walks, and potty breaks help your pet feel secure."
                )
                AdoptionGuideRow(
                    iconName: "cross.fill",
                    iconColor: .red,
                    title: "Schedule a Vet Visit",
                    description: "Take your new pet for a check-up soon after adoption, even if they seem healthy."
                )
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Adoption Guide")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AdoptionGuideView()
    }
}
