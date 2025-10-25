//
//  ProfileView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//

import SwiftUI

struct ProfileView: View {
    
    let userName = "Kevin De Bruino"
    let userImage = "user-profile"
    let userDescription = "Animal lover, I'am 27 and i live in Napoli, I want a dog of small size! 🐾"
    
    let myPetsPhotos: [String] = ["dog-dummy-10", "dog-dummy-9"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    
                    VStack(spacing: 8) {
                        Image(userImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.brandPrimary, lineWidth: 4)
                            )
                            .padding(.top, 20)
                        
                        Text(userName)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(userDescription)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("My Pets")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(myPetsPhotos, id: \.self) { photoName in
                                    Image(photoName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 110, height: 110)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                                
                                Button(action: {
                                    print("Add photo tapped!")
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color(.systemGray6))
                                            .frame(width: 110, height: 110)
                                        
                                        Image(systemName: "plus")
                                            .font(.title.weight(.bold))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
