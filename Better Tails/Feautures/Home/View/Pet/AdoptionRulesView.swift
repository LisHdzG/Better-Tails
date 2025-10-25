//
//  AdoptionRulesView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//

import SwiftUI

struct RuleRow: View {
    var emoji: String
    var title: String
    var description: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(emoji)
                .font(.title2)
                .padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
        }
    }
}

struct AdoptionRulesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showSuccessScreen: Bool
    
    var body: some View {
        NavigationView {
                VStack(alignment: .leading, spacing: 20) {
                   
                    HStack ( alignment: .center) {
                        Spacer()
                        Text("Ready to Adopt?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    RuleRow(emoji: "❤️",
                            title: "It's a Forever Commitment",
                            description: "Pets aren't temporary! They are a 10-15+ year promise. Be ready for the entire journey, through good times and bad.")
                    
                    RuleRow(emoji: "💰",
                            title: "Check Your Budget",
                            description: "Get ready for food, vet visits, toys, and surprise medical bills. Make sure you're financially prepared for their needs.")
                    
                    RuleRow(emoji: "⏰",
                            title: "Patience is Key (Lots of it!)",
                            description: "Your new friend needs time to adjust. They might be shy, scared, or have accidents. Give them space, love, and time to feel safe.")

                    RuleRow(emoji: "🏠",
                            title: "Is Your Home Ready?",
                            description: "Do you have enough space? If you rent, does your landlord allow pets? 'Pet-proof' your home to keep them safe from hazards.")
                    
                    RuleRow(emoji: "👨‍👩‍👧‍👦",
                            title: "Everyone Must Be On Board",
                            description: "Make sure everyone in your household (family, roommates) is excited and agrees to help care for your new pet.")
                    
                    RuleRow(emoji: "🎓",
                            title: "Training Takes Time & Love",
                            description: "Be prepared to invest time in positive training and socialization. It builds a strong, happy bond and a well-behaved companion.")
                    
                    Spacer()
                    Divider()

                    Button(action: {
                        self.showSuccessScreen = true
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Let's start the process!!")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    .background(.brandPrimary)
                    .cornerRadius(25)
                }.padding()
        }
    }
}
