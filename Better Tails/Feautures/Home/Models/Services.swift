//
//  Services.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI

enum ServiceType {
    case training       // Existing
    case adoptionGuide  // How to adopt
    case foundPet       // What to do if you find a stray
    case petCareTips    // General care advice
    case emergency      // What to do in an emergency
}

struct Service: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: ServiceType
}
