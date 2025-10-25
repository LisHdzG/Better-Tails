//
//  ShelterBannerView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI
import SwiftUI

struct ShelterBannerView: View {

    let shelterName = "Furry Rescue Italy"
    let callToAction = "Discover their work & how to help!"
    let shelterImageName = "apan-shelter-promo"

    var onTapAction: () -> Void

    var body: some View {
        ZStack(alignment: .leading) {
            Image(shelterImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .overlay {
                     if UIImage(named: shelterImageName) == nil {
                          Rectangle()
                             .fill(.gray.opacity(0.1))
                             .overlay(Text("Shelter Image").foregroundColor(.secondary))
                      }
                  }

            LinearGradient(
                colors: [.black.opacity(0.6), .black.opacity(0.1)],
                startPoint: .leading,
                endPoint: .trailing
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(shelterName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(callToAction)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
        }
        .frame(height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 5, y: 3)
        .contentShape(Rectangle())
        .onTapGesture {
            onTapAction()
        }
    }
}
