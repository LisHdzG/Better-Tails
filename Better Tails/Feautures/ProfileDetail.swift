//
//  ProfileDetail.swift
//  Challange1Daquiri
//
//  Created by Agostino Barone on 21/10/25.
//

import SwiftUI

struct ProfileDetail: View {
    @State private var isFavorite = false
    @Environment(\.dismiss) var dismiss // For comeback to Home
    var body: some View {
        VStack {
            // Profile photo
            Image("user-profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 5)
                .padding(.top, 40)
            
            Text("Kevin De Bruino")
                .font(.title)
                .foregroundColor(Color(.label))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 4)
            
            Text("Animal lover, iam 27 and i live in Napoli, i want a dog of small size !")
                .font(.body)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 4)
            
            Spacer()
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    VStack {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                        Text("Favorite")
                    }
                    .foregroundColor(isFavorite ? .red : . primary)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(16)
            .shadow(radius: 2)
            .padding(.horizontal)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileDetail()
}
