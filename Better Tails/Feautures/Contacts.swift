//
//  Contacts.swift
//  Challange1Daquiri
//
//  Created by Agostino Barone on 21/10/25.
//

import SwiftUI

struct ContactsView: View {
    // Stato per la Dark Mode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Email
                HStack {
                    Image(systemName: "envelope")
                    Text("email@esempio.com")
                        .foregroundColor(Color(.label))
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)

                // Numero di telefono
                HStack {
                    Image(systemName: "phone")
                    Text("+39 123 456 7890")
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                // Toggle per la Dark Mode
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                        .font(.headline)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Contacts")
            .preferredColorScheme(isDarkMode ? .dark : .light) // applica la Dark Mode
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
