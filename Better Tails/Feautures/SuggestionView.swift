//
//  SuggestionView.swift
//  PetFinder
//
//  Created by Mohammad on 21/10/25.
//

import SwiftUI

struct SuggestionView: View {
    // حالت انتخاب (مثال)
    @State private var selection: String? = nil
    // برای نمایش modal یا ناوبری در صورت نیاز
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack { // پس‌زمینه کلی
            Color(UIColor.systemGray6)
                .ignoresSafeArea()

            // کارت سفید مرکزی با گوشه‌های گرد
            VStack {
                // بالا: دکمه‌ی برگشت و فاصله
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .medium))
                            .frame(width: 44, height: 44)
                            .background(Color(UIColor.systemGray5))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 12)

                Spacer(minLength: 6)

                // عنوان
                Text("What are you looking for")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 28)
                    .padding(.top, 6)

                // دکمه‌های انتخابی
                VStack(spacing: 16) {
                    SelectionButton(title: "Dogs", isSelected: selection == "Dogs") {
                        withAnimation { selection = "Dogs" }
                    }
                    SelectionButton(title: "Cats", isSelected: selection == "Cats") {
                        withAnimation { selection = "Cats" }
                    }
                }
                .padding(.horizontal, 28)
                .padding(.top, 18)

                Spacer()
            }
            .frame(maxWidth: 370) // شبیه قالب موبایل وسط صفحه روی iPad/Mac
            .background(Color(UIColor.systemBackground))
            .cornerRadius(28)
            .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 6)
            .padding(.horizontal, 24)
            .padding(.vertical, 36)
        }
    }
}

struct SelectionButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding()
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(UIColor.systemGray5))
                    .opacity(isSelected ? 1.0 : 0.9)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Preview
struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SuggestionView()
                .previewDevice("iPhone 14 Pro")
            SuggestionView()
                .previewDevice("iPhone SE (3rd generation)")
                .preferredColorScheme(.dark)
        }
    }
}
