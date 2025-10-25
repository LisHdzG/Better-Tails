//
//  HeaderView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack (spacing: 10) {
            Image(.userProfile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .tint(.brandPrimary)
                .clipped()
                .clipShape(Circle())
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.red)
                    .padding(.vertical)
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 2) {
                    Text("My location")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .opacity(0.8)
                        .foregroundColor(.primary)
                    Text("Apple Developer Academy")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(3)
                .padding(.trailing, 10)
                Spacer()
            }
            .glassEffect(.regular)
            
            
            Button(action: {
            }, label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.brandPrimary)
                    .clipShape(Circle())
            })
            .glassEffect()
            
        }
    }
}

#Preview {
    HeaderView()
}
