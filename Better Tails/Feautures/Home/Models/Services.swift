//
//  Services.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI

enum ServicesType {
    case training
}

struct Services: Identifiable {
    var id = UUID()
    
    var name: String
    var image: String
    var type: ServicesType
}
