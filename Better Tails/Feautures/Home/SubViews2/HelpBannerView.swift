//
//  HelpBannerView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct HelpBannerView: View {
    var body: some View {
        Button(action: {
            // Acción para el banner de ayuda
        }) {
            HStack {
                Text("What can I do if I can't adopt?")
                    .font(.headline)
                Spacer()
                Image(systemName: "message.fill")
            }
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}


#Preview {
    HelpBannerView()
}
