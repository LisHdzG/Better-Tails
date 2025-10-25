//
//  EmergencyInfoView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI

struct EmergencyAction: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let iconName: String
    let color: Color
    let importantNote: String?
}

let sampleEmergencyActions: [EmergencyAction] = [
    EmergencyAction(
        title: "Difficulty Breathing",
        description: "Gasping, choking, blue gums. Keep pet calm, ensure open airway. Head to vet IMMEDIATELY.",
        iconName: "lungs.fill",
        color: .red,
        importantNote: "Critical emergency. Do not delay."
    ),
    EmergencyAction(
        title: "Severe Bleeding",
        description: "Apply firm, direct pressure to the wound with a clean cloth. Elevate limb if possible. Go to vet IMMEDIATELY.",
        iconName: "bandage.fill",
        color: .red,
        importantNote: "Do not use tourniquets unless instructed."
    ),
    EmergencyAction(
        title: "Seizures",
        description: "Move objects away to prevent injury. Do NOT restrain pet. Time the seizure. Call vet after it stops.",
        iconName: "waveform.path.ecg",
        color: .orange,
        importantNote: "Stay calm, protect the pet from harm."
    ),
    EmergencyAction(
        title: "Vomiting/Diarrhea (Severe)",
        description: "Multiple episodes, blood present, or combined with lethargy. Withhold food, offer small amounts of water. Contact vet.",
        iconName: "cross.vial.fill",
        color: .orange,
        importantNote: "Dehydration is a major risk."
    ),
    EmergencyAction(
        title: "Suspected Poisoning",
        description: "Identify the substance if possible (bring packaging). Do NOT induce vomiting unless told. Call vet or Pet Poison Helpline IMMEDIATELY.",
        iconName: "exclamationmark.triangle.fill",
        color: .red,
        importantNote: "Time is critical. Call first."
    ),
    EmergencyAction(
        title: "Heatstroke",
        description: "Excessive panting, lethargy, collapse. Move to cool area, apply cool (not cold) water to body. Go to vet IMMEDIATELY.",
        iconName: "sun.max.fill",
        color: .red,
        importantNote: "Do not overcool. Transport ASAP."
    ),
    EmergencyAction(
        title: "Unable to Urinate/Defecate",
        description: "Straining with no results, pain. Can indicate a blockage. Go to vet IMMEDIATELY.",
        iconName: "exclamationmark.octagon.fill",
        color: .red,
        importantNote: "Especially critical for male cats."
    ),
]

struct EmergencyActionCard: View {
    let action: EmergencyAction

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: action.iconName)
                    .font(.title2.weight(.bold))
                    .foregroundColor(action.color)
                
                Text(action.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(action.color)
                
                Spacer()
            }
            
            Text(action.description)
                .font(.subheadline)
                .foregroundColor(.primary.opacity(0.8))
                
            if let note = action.importantNote {
                HStack(alignment: .firstTextBaseline) {
                     Image(systemName: "lightbulb.fill")
                         .foregroundColor(.yellow)
                         .font(.caption)
                     Text(note)
                         .font(.caption)
                         .fontWeight(.medium)
                         .foregroundColor(.secondary)
                 }
                 .padding(.top, 5)
            }
        }
        .padding()
        .background(action.color.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(action.color.opacity(0.5), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct EmergencyInfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {

                HStack {
                    Text("Pet Emergencies")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        if let url = URL(string: "tel://+525559444793") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "phone.fill")
                            .font(.title3)
                    }
                    .buttonStyle(.glass)
                    .padding(.trailing, 20)
                }
               
                Text("Act quickly. Call your vet first if possible.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                ForEach(sampleEmergencyActions) { action in
                    EmergencyActionCard(action: action)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }

            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Emergency Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EmergencyInfoView()
    }
}
