//
//  PetCareTipsView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

enum PetCareCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case food = "Food"
    case health = "Health"
    case grooming = "Grooming"
    case play = "Play"
    case safety = "Safety"

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .all: return "pawprint.circle.fill"
        case .food: return "carrot.fill"
        case .health: return "heart.fill"
        case .grooming: return "scissors"
        case .play: return "figure.walk"
        case .safety: return "shield.fill"
        }
    }
}

struct PetCareTip: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let category: PetCareCategory
}

let samplePetCareTips: [PetCareTip] = [
    PetCareTip(title: "Balanced Diet is Key", description: "Choose high-quality food appropriate for your pet's age, breed, and activity level. Avoid feeding table scraps.", imageName: "pet-food-bowl", category: .food),
    PetCareTip(title: "Fresh Water Always", description: "Ensure your pet has access to clean, fresh water at all times. Change it daily.", imageName: "pet-water-bowl", category: .food),
    PetCareTip(title: "Regular Vet Check-ups", description: "Annual wellness exams are crucial for catching potential health issues early. Keep vaccinations up-to-date.", imageName: "vet-checkup", category: .health),
    PetCareTip(title: "Know Emergency Signs", description: "Learn to recognize signs of distress like difficulty breathing, excessive vomiting, or sudden lethargy.", imageName: "pet-emergency", category: .health),
    PetCareTip(title: "Brush Regularly", description: "Brushing helps remove loose hair, prevents mats (especially in long-haired pets), and distributes natural oils.", imageName: "pet-brushing", category: .grooming),
    PetCareTip(title: "Nail Trims Matter", description: "Overgrown nails can be painful and cause walking problems. Trim them regularly or have a groomer/vet do it.", imageName: "pet-nail-trim", category: .grooming),
    PetCareTip(title: "Daily Exercise", description: "Regular walks, playtime, or interactive toys are essential for physical and mental health. Tailor it to your pet's needs.", imageName: "pet-playing-fetch", category: .play),
    PetCareTip(title: "Mental Stimulation", description: "Puzzle toys, training sessions, or exploring new safe environments prevent boredom and destructive behaviors.", imageName: "pet-puzzle-toy", category: .play),
    PetCareTip(title: "Pet-Proof Your Home", description: "Keep toxic plants, chemicals, medications, and small swallowable objects out of reach.", imageName: "pet-proofing-home", category: .safety),
    PetCareTip(title: "Secure ID Tags & Microchip", description: "Ensure your pet always wears a collar with ID tags and has an up-to-date microchip.", imageName: "pet-id-tag", category: .safety),
]

struct CategoryChipView: View {
    let category: PetCareCategory
    @Binding var selectedCategory: PetCareCategory

    var isSelected: Bool {
        selectedCategory == category
    }

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: category.icon)
            Text(category.rawValue)
        }
        .font(.caption)
        .fontWeight(.medium)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .foregroundColor(isSelected ? .white : .primary)
        .background(isSelected ? Color.brandPrimary : Color(.systemGray5))
        .clipShape(Capsule())
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedCategory = category
            }
        }
    }
}

struct PetCareTipCardView: View {
    let tip: PetCareTip

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(tip.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .clipped()
                .overlay {
                     if UIImage(named: tip.imageName) == nil {
                          Rectangle()
                             .fill(.gray.opacity(0.1))
                             .overlay(Text("Placeholder").foregroundColor(.secondary))
                      }
                  }

            VStack(alignment: .leading, spacing: 8) {
                Text(tip.title)
                    .font(.headline)
                    .fontWeight(.bold)

                Text(tip.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
            .padding()
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.08), radius: 6, y: 4)
    }
}

struct PetCareTipsView: View {
    @State private var selectedCategory: PetCareCategory = .all
    
    var filteredTips: [PetCareTip] {
        if selectedCategory == .all {
            return samplePetCareTips
        } else {
            return samplePetCareTips.filter { $0.category == selectedCategory }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(PetCareCategory.allCases) { category in
                        CategoryChipView(category: category, selectedCategory: $selectedCategory)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            .background(Color(.systemBackground))

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(filteredTips) { tip in
                        PetCareTipCardView(tip: tip)
                            .padding(.horizontal)
                            .transition(.opacity.combined(with: .scale(scale: 0.9)))
                    }
                }
                .padding(.top)
                .padding(.bottom)
            }
            
        }
        .navigationTitle("Pet Care Tips")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        PetCareTipsView()
    }
}
