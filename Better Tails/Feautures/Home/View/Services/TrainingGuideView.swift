//
//  TrainingGuideView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct TrainingStepCard: View {
    let stepNumber: Int
    let title: String
    let description: String
    let imageName: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("\(stepNumber)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.brandPrimary)
                    .clipShape(Circle())
                    .glassEffect()
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        if UIImage(named: imageName) == nil {
                             Rectangle()
                                .fill(.gray.opacity(0.1))
                                .overlay(Text("Placeholder").foregroundColor(.secondary))
                         }
                     }
            }
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct TrainingGuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Basic Training Principles")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text("Positive reinforcement is key! Reward good behavior with treats, praise, or toys.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)

                TrainingStepCard(
                    stepNumber: 1,
                    title: "Keep it Short & Fun",
                    description: "Keep training sessions brief (5-10 minutes) especially for puppies or kittens. End on a positive note!",
                    imageName: "training-fun-placeholder"
                )
                
                TrainingStepCard(
                    stepNumber: 2,
                    title: "Use Clear Cues",
                    description: "Use simple, consistent words (like 'Sit', 'Stay', 'Come') and hand signals. Avoid repeating commands if your pet doesn't respond immediately.",
                    imageName: "training-cues-placeholder"
                )
                
                TrainingStepCard(
                    stepNumber: 3,
                    title: "Reward Immediately",
                    description: "Reward the desired behavior the instant it happens. This helps your pet understand exactly what you're asking for.",
                    imageName: "training-reward-placeholder"
                )
                
                TrainingStepCard(
                    stepNumber: 4,
                    title: "Be Patient & Consistent",
                    description: "Every pet learns at their own pace. Be patient, stay positive, and practice consistently every day.",
                    imageName: "training-patience-placeholder"
                )
            }
            .padding()
        }
        .navigationTitle("Training Guide")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TrainingGuideView()
    }
}
