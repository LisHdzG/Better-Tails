//
//  HelpOptionsView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct HelpOptionRow: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(iconColor)
                .frame(width: 40, height: 40)
                .background(iconColor.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct HelpOptionsView: View {
    var body: some View {
        List {
            Section(header: Text("Direct Support")) {
                HelpOptionRow(
                    iconName: "heart.fill",
                    iconColor: .red,
                    title: "Donate",
                    description: "Every contribution helps us care for more pets."
                )
                
                HelpOptionRow(
                    iconName: "gift.fill",
                    iconColor: .orange,
                    title: "Donate Supplies",
                    description: "We always need food, toys, and blankets."
                )
            }
            
            Section(header: Text("With Your Time")) {
                HelpOptionRow(
                    iconName: "person.2.fill",
                    iconColor: .blue,
                    title: "Volunteer",
                    description: "Donate your time to walk, play, and care."
                )
                
                HelpOptionRow(
                    iconName: "house.fill",
                    iconColor: .brandPrimary,
                    title: "Become a Foster Parent",
                    description: "Provide a temporary, loving home."
                )
            }
            
            Section(header: Text("Other Ways")) {
                HelpOptionRow(
                    iconName: "square.and.arrow.up.fill",
                    iconColor: .purple,
                    title: "Share on Social Media",
                    description: "Help us spread the word about available pets."
                )
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Ways to Help")
        .navigationBarTitleDisplayMode(.inline)
    }
}
