//
//  PetCardBackView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct PetCardBackView: View {
    let pet: Pets

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("About \(pet.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Spacer()
                
                Image(pet.gender == .female ? .iconFemenine : .iconMars)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {
                        Circle()
                            .fill(.brandPrimary.opacity(0.5))
                    }
            }

            HStack(spacing: 12) {
                StatBox(title: "Weight", value: pet.weight)
                StatBox(title: "Friendly", value: pet.friendliness)
                StatBox(title: "Age", value: pet.age)
            }
            
            Divider()
            
            Text(pet.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(5)
            
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(radius: 10)
    }
}
