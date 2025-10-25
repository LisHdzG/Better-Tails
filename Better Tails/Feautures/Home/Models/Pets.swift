//
//  Pets.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI
import MapKit

enum PetType {
    case cat, dog
}
enum PetGender {
    case male, female
}

struct Pets: Identifiable {
    var id: String { photo }
    var name: String
    var photo: String
    var lat: Double
    var long: Double
    var gender: PetGender
    var location: String
    var petType: PetType
    var favorite: Bool = false
    
    var weight: String
    var age: String
    var friendliness: String
    var description: String
    var ownerName: String
    var ownerImage: String
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}

