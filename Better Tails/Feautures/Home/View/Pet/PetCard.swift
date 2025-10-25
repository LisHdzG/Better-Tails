//
//  PetCard.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct PetCard: View {
    let pet: Pets
    let onFavoriteToggle: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack (alignment: .topTrailing) {
                
                Image(pet.photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                
                Button(action: {
                    onFavoriteToggle()
                }) {
                    Image(systemName: pet.favorite ? "heart.fill" : "heart")
                        .frame(width: 30, height: 30)
                        .font(.caption)
                        .tint(.red)
                }
                .padding(8)
                .buttonStyle(.glass)
            }
            .frame(width: 180, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text(pet.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(pet.location)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(pet.gender == .female ? .iconFemenine : .iconMars)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background {
                        Circle()
                            .fill(.gray.opacity(0.3))
                    }
            }
            .frame(width: 180)
        }
    }
}
