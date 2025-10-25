//
//  FoundPetView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct FoundPetActionCard: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let description: String

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 35, weight: .medium))
                    .foregroundColor(iconColor)
            }
            .frame(width: 80)
            .frame(maxHeight: .infinity)
            .background(iconColor.opacity(0.1))

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 15)
            .padding(.leading, 15)
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity)
            .background(Color(.secondarySystemGroupedBackground))
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.05), radius: 5, y: 3)
    }
}

struct FoundPetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {

                Text("Found a Lost Pet?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Text("Immediate steps to take:")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .padding(.bottom, 15)

                VStack (spacing: 15) {
                    FoundPetActionCard(
                        iconName: "figure.walk",
                        iconColor: .orange,
                        title: "Approach Safely",
                        description: "Move slowly, speak softly. Check for nearby owners before intervening."
                    )
                    
                    FoundPetActionCard(
                        iconName: "tag.fill",
                        iconColor: .blue,
                        title: "Check for ID",
                        description: "Look carefully for a collar with tags or contact information."
                    )
                    
                    FoundPetActionCard(
                        iconName: "shield.lefthalf.filled",
                        iconColor: .green,
                        title: "Contain Safely (If Possible)",
                        description: "If the pet seems friendly, use a leash or secure it in a safe, enclosed area."
                    )
                    
                    FoundPetActionCard(
                        iconName: "drop.fill",
                        iconColor: .cyan,
                        title: "Provide Water",
                        description: "Offer fresh water. Avoid giving food unless necessary and the pet seems healthy."
                    )
                    
                    FoundPetActionCard(
                        iconName: "phone.bubble.left.fill",
                        iconColor: .purple,
                        title: "Report the Pet",
                        description: "Contact local animal shelters & rescues. Ask about scanning for a microchip."
                    )
                    
                    FoundPetActionCard(
                        iconName: "megaphone.fill",
                        iconColor: .red,
                        title: "Spread the Word",
                        description: "Post clear photos on local social media groups and consider 'Found Pet' flyers."
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Found a Pet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FoundPetView()
    }
}
