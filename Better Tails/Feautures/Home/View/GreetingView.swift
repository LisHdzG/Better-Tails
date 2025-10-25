//
//  GreetingView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Welcome back! 🐾")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.brandPrimary)
            Text("Every day is a new chance to make a tail wag.")
                .font(.caption)
                .foregroundColor(.primary.opacity(0.3))
        }
       
    }
}

#Preview {
    GreetingView()
}
