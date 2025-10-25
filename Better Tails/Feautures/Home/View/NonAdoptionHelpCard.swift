//
//  NonAdoptionHelpCard.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct NonAdoptionHelpCard: View {
    // Imagen representativa (¡Necesitarás añadirla!)
    let imageName = "helping-hands-pets"
    let title = "Can't Adopt Right Now?"
    let subtitle = "There are many other ways to make a difference for pets in need."

    var body: some View {
        NavigationLink(destination: HelpOptionsView()) {
            VStack(alignment: .leading, spacing: 0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .overlay {
                         if UIImage(named: imageName) == nil {
                              Rectangle()
                                 .fill(.gray.opacity(0.1))
                                 .overlay(VStack {
                                     Image(systemName: "photo.on.rectangle.angled")
                                     Text("Help Image").font(.caption)
                                 }.foregroundColor(.secondary))
                          }
                      }
                    .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        Text("See how you can help")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "arrow.right.circle.fill")
                    }
                    .foregroundColor(.brandPrimary)
                    .padding(.top, 5)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)

                }
            }
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.1), radius: 5, y: 3)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NonAdoptionHelpCard()
        .padding()
}
