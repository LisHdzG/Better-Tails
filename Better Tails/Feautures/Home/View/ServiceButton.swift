//
//  ServiceButton.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 21/10/25.
//

import SwiftUI

struct ServiceButton: View {
    let service: Services
    
    var body: some View {
        VStack(spacing: 8) {
            Image(service.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(.brandPrimary)
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.95, green: 0.95, blue: 0.97))
                }
            
            Text(service.name)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    ServiceButton(service: Services(name: "name",
                                    image: "image",
                                    type: .training))
}
