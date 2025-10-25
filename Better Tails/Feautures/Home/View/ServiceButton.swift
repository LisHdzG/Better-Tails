//
//  ServiceButton.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct ServiceButton: View {
    let service: Service
     
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: service.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(.brandPrimary)
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                }
             
            Text(service.name)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
