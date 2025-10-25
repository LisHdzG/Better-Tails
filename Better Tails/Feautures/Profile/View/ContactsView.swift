//
//  Contacts.swift
//  Challange1Daquiri
//
//  Created by Agostino Barone on 21/10/25.
//

import SwiftUI

struct ContactsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    let emailAddress = "support@bettertails.com"
    let phoneNumber = "+391234567890"
    let displayPhoneNumber = "+39 123 456 7890"

    var body: some View {
        List {
            Section("Get in Touch") {
                Link(destination: URL(string: "mailto:\(emailAddress)")!) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.brandPrimary)
                        Text(emailAddress)
                        Spacer()
                    }
                }
                .foregroundColor(.primary)

                Link(destination: URL(string: "tel:\(phoneNumber)")!) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.brandPrimary)
                        Text(displayPhoneNumber)
                        Spacer()
                    }
                }
                .foregroundColor(.primary)
            }

            Section("Settings") {
                Toggle(isOn: $isDarkMode) {
                    Label("Dark Mode", systemImage: isDarkMode ? "moon.fill" : "sun.max.fill")
                }
                .tint(.brandPrimary)
            }
             
             Section("About") {
                 HStack {
                     Text("App Version")
                     Spacer()
                     Text("1.0.0")
                         .foregroundColor(.secondary)
                 }
             }

        }
        .listStyle(.insetGrouped)
        .navigationTitle("Contact & Settings")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
