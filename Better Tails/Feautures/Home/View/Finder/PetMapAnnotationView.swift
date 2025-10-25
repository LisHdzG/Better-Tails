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
        let isFavorite = pet.favorite
        let iconName = isFavorite ? "heart.fill" : (pet.petType == .dog ? "dog.fill" : "cat.fill")

        let selectedColor: Color = isFavorite ? .red : .brandPrimary
        let deselectedColor: Color = isFavorite ? .red.opacity(0.7) : .brandPrimary.opacity(0.5)
        let strokeColor: Color = isSelected ? selectedColor : (isFavorite ? .red.opacity(0.5) : .gray.opacity(0.5))

        ZStack {
            Image(systemName: iconName)
                .font(.body)
                .foregroundStyle(isSelected ? selectedColor : deselectedColor)
                .padding(8)
                .background(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(
                            strokeColor,
                            lineWidth: isSelected ? 4 : (isFavorite ? 2 : 1)
                        )
                )
                .shadow(color: .black.opacity(0.3), radius: 3, y: 2)
                .scaleEffect(isSelected ? 1.2 : 1.0)
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
    }
}
