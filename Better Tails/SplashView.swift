//
//  SplashView.swift
//  Challange1Daquiri
//
//  Created by Agostino Barone on 17/10/25.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isActive: Bool
    
    @State private var logoScale: CGFloat = 0.0
    @State private var logoOpacity: Double = 0.0
    
    @State private var pawOpacities: [Int: Double] = [:]
    
    let pawSteps: [(id: Int, offset: CGSize, rotation: Angle, appearDelay: Double)] = [
        (id: 0, CGSize(width: -60, height: 400), .degrees(20), 0.0),
        (id: 1, CGSize(width: 40, height: 330), .degrees(-15), 0.2),
        (id: 2, CGSize(width: -50, height: 260), .degrees(20), 0.4),
        (id: 3, CGSize(width: 30, height: 190), .degrees(-15), 0.6),
        (id: 4, CGSize(width: -60, height: 120), .degrees(20), 0.8),
        (id: 5, CGSize(width: 40, height: 50), .degrees(-15), 1.0),
        (id: 6, CGSize(width: -30, height: -20), .degrees(20), 1.2)
    ]
    
    let pawAppearDuration: Double = 0.3
    let pawFadeDuration: Double = 0.5
    let logoAppearDelay: Double = 1.5
    let splashDuration: Double = 3.0

    var body: some View {
        ZStack {
            Color.brandPrimary.ignoresSafeArea()

            ZStack {
                ForEach(pawSteps, id: \.id) { paw in
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .rotationEffect(paw.rotation)
                        .offset(paw.offset)
                        .opacity(pawOpacities[paw.id] ?? 0.0)
                }
            }

            Image(.betterTailsWhiteLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .scaleEffect(logoScale)
                .opacity(logoOpacity)
        }
        .onAppear {
            for (index, paw) in pawSteps.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + paw.appearDelay) {
                    withAnimation(.easeOut(duration: pawAppearDuration)) {
                        pawOpacities[paw.id] = 0.7
                    }
                }
                
                if index > 0 {
                    let previousPaw = pawSteps[index - 1]
                    DispatchQueue.main.asyncAfter(deadline: .now() + paw.appearDelay + pawAppearDuration * 0.5) {
                        withAnimation(.easeOut(duration: pawFadeDuration)) {
                            pawOpacities[previousPaw.id] = 0.0
                        }
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + logoAppearDelay) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                    logoScale = 1.0
                    logoOpacity = 1.0
                }
                
                if let lastPaw = pawSteps.last {
                    withAnimation(.easeOut(duration: pawFadeDuration)) {
                        pawOpacities[lastPaw.id] = 0.0
                    }
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) {
                withAnimation {
                    isActive = false
                }
                pawOpacities.removeAll()
            }
        }
    }
}
