//
//  PetCardFrontView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct PetCardFrontView: View {
    let pet: Pets

    var body: some View {
        Image(pet.photo)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 350, height: 550)
            .overlay(
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.8)],
                        startPoint: .center,
                        endPoint: .bottom
                    )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(pet.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Image(pet.gender == .female ? .iconFemenine : .iconMars)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 14, height: 14)
                                .foregroundStyle(.white)
                                .padding(5)
                                .background {
                                    Circle()
                                        .fill(.gray.opacity(0.2))
                                }
                        }
                         
                        Text(pet.location)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(20)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .shadow(radius: 10)
    }
}
