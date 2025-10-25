//
//  ServicesViewModel.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

struct ServicesViewModel {
    let services: [Service] = [
        Service(name: "Training", image: "graduationcap.fill", type: .training),
        Service(name: "Adoption Guide", image: "book.closed.fill", type: .adoptionGuide),
        Service(name: "Found a Pet?", image: "questionmark.diamond.fill", type: .foundPet),
        Service(name: "Care Tips", image: "heart.text.square.fill", type: .petCareTips),
        Service(name: "Emergencies", image: "cross.case.fill", type: .emergency),
    ]
}
