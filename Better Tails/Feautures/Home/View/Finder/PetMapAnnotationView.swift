//
//  PetMapAnnotationView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//

import SwiftUI

struct PetMapAnnotationView: View {
    let pet: Pets
    let isSelected: Bool
    
    var body: some View {
        let iconName = pet.petType == .dog ? "dog.fill" : "cat.fill"
        
        ZStack {
            Image(systemName: iconName)
                .font(.body)
                .foregroundStyle(isSelected ? .brandPrimary : .brandPrimary.opacity(0.5))
                .padding(8)
                .background(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(
                            isSelected ? Color.brandPrimary : Color.gray.opacity(0.5),
                            lineWidth: isSelected ? 4 : 1
                        )
                )
                .shadow(color: .black.opacity(0.3), radius: 3, y: 2)
                .scaleEffect(isSelected ? 1.2 : 1.0)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
    }
}
