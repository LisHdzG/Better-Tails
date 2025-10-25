//
//  HelpBannerView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI
import SwiftUI
import SwiftUI

struct HelpBannerView: View {
    var body: some View {
        NavigationLink(destination: HelpOptionsView()) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Can't adopt right now?")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("See other ways you can help")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.callout)
                    .foregroundColor(.secondary.opacity(0.7))
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .glassEffect()
        }
        //.buttonStyle(.glass)
    }
}
