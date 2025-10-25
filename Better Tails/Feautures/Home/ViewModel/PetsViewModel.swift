//
//  PetsViewModel.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 23/10/25.
//

import SwiftUI
import Combine

class PetsViewModel: ObservableObject {
    
    private let favoritesKey = "favoritePetIDs"
    
    @Published var pets: [Pets] = []
    @Published var filteredFavoritePets: [Pets] = []
    @Published var petInAdoption: Pets? = nil
    @Published var adoptionStage: AdoptionStage = .applying
    
    init() {
        loadPetData()
        loadFavorites()
        applyFavoriteFilter()
    }
    
    func startAdoptionProcess(pet: Pets) {
        self.petInAdoption = pet
        self.adoptionStage = .applying
        
        self.pets.removeAll { $0.id == pet.id }
    }
    
    private func applyFavoriteFilter() {
        let allFavorites = pets.filter { $0.favorite }
        filteredFavoritePets = allFavorites
    }
    
    func toggleFavorite(for pet: Pets) {
        if let index = pets.firstIndex(where: { $0.id == pet.id }) {
            pets[index].favorite.toggle()
            saveFavorites()
            
            applyFavoriteFilter()
        }
    }
    
    var favoriteCatCount: Int {
            pets.filter { $0.favorite && $0.petType == .cat }.count
    }
    
    var favoriteDogCount: Int {
        pets.filter { $0.favorite && $0.petType == .dog }.count
    }
    
    private func saveFavorites() {
        let favoriteIDs = pets
            .filter { $0.favorite }
            .map { $0.id }
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
        print("Favoritos guardados: \(favoriteIDs)")
    }
    
    private func loadFavorites() {
        let favoriteIDs = UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? []
        let idSet = Set(favoriteIDs)
        for i in pets.indices {
            let petIDString = pets[i].id
            if idSet.contains(petIDString) {
                pets[i].favorite = true
            }
        }
        print("Favoritos cargados: \(idSet)")
    }
    
    private func loadPetData() {
        let petsList = [
            Pets(name: "Michi",
                 photo: "cat-dummy-1",
                 lat: 40.8355, long: 14.3020,
                 gender: .male, location: "Academy Campus", petType: .cat,
                 weight: "11 lbs", age: "3 years", friendliness: "Curious",
                 description: "Michi was found exploring the Academy Campus. He's incredibly curious and loves to sit on laptops. He's looking for a home where he can be the center of attention and have plenty of windows to look out of.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
            
            Pets(name: "Nala",
                 photo: "cat-dummy-2",
                 lat: 40.8380, long: 14.2980,
                 gender: .female, location: "Via Traversa Protopisani", petType: .cat,
                 weight: "9 lbs", age: "2 years", friendliness: "Affectionate",
                 description: "Nala is a sweet, affectionate cat who loves a good cuddle. She was rescued and is now ready for her forever home. She gets along well with other cats but prefers a calm environment.",
                 ownerName: "Faithful Friend", ownerImage: "shelter-dummy-2"),
            
            Pets(name: "Simba",
                 photo: "cat-dummy-3",
                 lat: 40.8400, long: 14.3050,
                 gender: .male, location: "Poggioreale", petType: .cat,
                 weight: "13 lbs", age: "5 years", friendliness: "Majestic",
                 description: "Simba lives up to his name. He's a majestic and confident cat who walks around like he owns the place. He is very independent but will seek you out for head scratches when he's in the mood.",
                 ownerName: "New Life Rescue", ownerImage: "shelter-dummy-3"),
            
            Pets(name: "Chloe",
                 photo: "cat-dummy-4",
                 lat: 40.8420, long: 14.2880,
                 gender: .female, location: "Stazione San Giovanni", petType: .cat,
                 weight: "8 lbs", age: "1 year", friendliness: "Playful",
                 description: "Chloe is a whirlwind of energy! Found playing near the station, she adores chasing laser pointers and feather toys. She is very playful and would best suit a home that can give her lots of playtime.",
                 ownerName: "Animal Home", ownerImage: "shelter-dummy-4"),
            
            Pets(name: "Oliver",
                 photo: "cat-dummy-5",
                 lat: 40.8320, long: 14.2950,
                 gender: .male, location: "Zona Industriale Est", petType: .cat,
                 weight: "12 lbs", age: "4 years", friendliness: "Calm",
                 description: "Oliver is a calm and gentle soul. He was found a bit lost but is now safe and sound. He loves long naps in sunbeams and is a very low-maintenance companion.",
                 ownerName: "Pet Ark Association", ownerImage: "shelter-dummy-5"),
            
            Pets(name: "Bella",
                 photo: "cat-dummy-6",
                 lat: 40.8450, long: 14.3100,
                 gender: .female, location: "Spiaggia di San Giovanni", petType: .cat,
                 weight: "10 lbs", age: "2 years", friendliness: "Shy",
                 description: "Bella is a beautiful but shy cat. She takes a little time to warm up, but once she trusts you, she's the most loyal companion. She prefers a quiet home without loud noises.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
            
            Pets(name: "Leo",
                 photo: "cat-dummy-7",
                 lat: 40.8500, long: 14.2850,
                 gender: .male, location: "Porto di Napoli", petType: .cat,
                 weight: "15 lbs", age: "6 years", friendliness: "Confident",
                 description: "Leo is the king of the port. He's a large, confident cat who isn't afraid of anything. He's very smart but has a soft spot for tuna. He's looking for a home where he can be the only pet and get all the love.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
            
            Pets(name: "Lila",
                 photo: "cat-dummy-8",
                 lat: 40.8330, long: 14.3000,
                 gender: .female, location: "Academy Gate", petType: .cat,
                 weight: "9 lbs", age: "3 years", friendliness: "Relaxed",
                 description: "Lila is the most relaxed cat you'll ever meet. She loves being brushed and will purr for hours. She's a perfect companion for binging shows on the couch. She gets along with everyone.",
                 ownerName: "Faithful Friend Center", ownerImage: "shelter-dummy-2"),
            
            Pets(name: "Milo",
                 photo: "cat-dummy-9",
                 lat: 40.8360, long: 14.2800,
                 gender: .male, location: "Via Galileo Ferraris", petType: .cat,
                 weight: "11 lbs", age: "1.5 years", friendliness: "Energetic",
                 description: "Milo is a young, energetic cat who is always ready for an adventure. He loves exploring every nook and cranny of the house and climbing to the highest spots. He needs a home that can keep up with him.",
                 ownerName: "New Life Rescue", ownerImage: "shelter-dummy-3"),
            
            Pets(name: "Mia",
                 photo: "cat-dummy-10",
                 lat: 40.8410, long: 14.2900,
                 gender: .female, location: "Mercato Ittico", petType: .cat,
                 weight: "9.5 lbs", age: "4 years", friendliness: "Vocal",
                 description: "Mia has a lot to say! She is a very vocal cat who loves to 'talk' with her humans. She will greet you at the door and tell you all about her day. She's very social and loving.",
                 ownerName: "Animal Home Foundation", ownerImage: "shelter-dummy-4"),
            
            Pets(name: "Koda",
                 photo: "cat-dummy-11",
                 lat: 40.8390, long: 14.3090,
                 gender: .male, location: "Quartiere San Giovanni", petType: .cat,
                 weight: "14 lbs", age: "5 years", friendliness: "Guardian",
                 description: "Koda is a large, protective cat. He likes to watch over the house from a high perch and make sure everything is in order. While he looks serious, he's a big softie at heart.",
                 ownerName: "Pet Ark Association", ownerImage: "shelter-dummy-5"),

            Pets(name: "Lily",
                 photo: "cat-dummy-12",
                 lat: 40.8310, long: 14.2860,
                 gender: .female, location: "Porto Esterno", petType: .cat,
                 weight: "8.5 lbs", age: "2 years", friendliness: "Goofy",
                 description: "Lily is a small cat with a big personality. She loves to play hide-and-seek and chase her own tail. She's incredibly entertaining and will bring a lot of joy to her new home.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
                 
            Pets(name: "Jax",
                 photo: "cat-dummy-13",
                 lat: 40.8340, long: 14.2910,
                 gender: .male, location: "Centro Commerciale", petType: .cat,
                 weight: "12 lbs", age: "3 years", friendliness: "Clever",
                 description: "Jax is too smart for his own good. He knows how to open doors and drawers. He's a very intelligent cat who needs mental stimulation, like food puzzles or learning tricks.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),

            Pets(name: "Buddy",
                 photo: "dog-dummy-1",
                 lat: 40.8351, long: 14.3014,
                 gender: .male, location: "Academy Campus", petType: .dog,
                 weight: "55 lbs", age: "4 years", friendliness: "Friendly",
                 description: "Buddy is everyone's best friend! He's a happy-go-lucky dog who was a campus favorite. He knows 'sit' and 'shake' and loves to play fetch. He is great with kids and other dogs.",
                 ownerName: "Faithful Friend Center", ownerImage: "shelter-dummy-2"),
                 
            Pets(name: "Lucy",
                 photo: "dog-dummy-2",
                 lat: 40.8385, long: 14.2985,
                 gender: .female, location: "Via Traversa Protopisani", petType: .dog,
                 weight: "40 lbs", age: "3 years", friendliness: "Energy",
                 description: "Lucy is a high-energy girl who needs room to run. She's incredibly smart and would excel at agility training. She needs an active owner who can keep up with her adventures.",
                 ownerName: "New Life Rescue", ownerImage: "shelter-dummy-3"),
                 
            Pets(name: "Kobe",
                 photo: "dog-dummy-3",
                 lat: 40.8405, long: 14.3055,
                 gender: .male, location: "Poggioreale", petType: .dog,
                 weight: "48 lbs", age: "2 years", friendliness: "Loyal",
                 description: "Kobe is an extremely loyal dog who bonds very strongly with his person. He's a bit reserved with strangers but is the most loving dog once he knows you. He would make a great watch dog.",
                 ownerName: "Animal Home Foundation", ownerImage: "shelter-dummy-4"),
                 
            Pets(name: "Daisy",
                 photo: "dog-dummy-4",
                 lat: 40.8425, long: 14.2885,
                 gender: .female, location: "Stazione San Giovanni", petType: .dog,
                 weight: "33 lbs", age: "5 years", friendliness: "Sweet",
                 description: "Daisy is pure sweetness. She is a calm, well-behaved dog who just wants to be near her people. She is perfect for a more relaxed home and is content with gentle walks and lots of pets.",
                 ownerName: "Pet Ark Association", ownerImage: "shelter-dummy-5"),
                 
            Pets(name: "Max",
                 photo: "dog-dummy-5",
                 lat: 40.8325, long: 14.2955,
                 gender: .male, location: "Zona Industriale Est", petType: .dog,
                 weight: "60 lbs", age: "3 years", friendliness: "Protective",
                 description: "Max is a strong and protective companion. He was found guarding an empty lot but is very gentle with people he trusts. He is looking for a confident owner who can continue his training.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
                 
            Pets(name: "Zoe",
                 photo: "dog-dummy-6",
                 lat: 40.8455, long: 14.3105,
                 gender: .female, location: "Spiaggia di San Giovanni", petType: .dog,
                 weight: "50 lbs", age: "2 years", friendliness: "Playful",
                 description: "Zoe LOVES the water. She was found happily splashing at the beach. She is a playful and goofy girl who would love a home with a yard, or even better, a pool!",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),
                 
            Pets(name: "Apollo",
                 photo: "dog-dummy-7",
                 lat: 40.8505, long: 14.2855,
                 gender: .male, location: "Porto di Napoli", petType: .dog,
                 weight: "70 lbs", age: "5 years", friendliness: "Gentle",
                 description: "Apollo is a true gentle giant. Despite his size, he's a bit of a lap dog. He is calm, patient, and absolutely loves belly rubs. He walks perfectly on a leash and is a perfect gentleman.",
                 ownerName: "Faithful Friend Center", ownerImage: "shelter-dummy-2"),
                 
            Pets(name: "Ruby",
                 photo: "dog-dummy-8",
                 lat: 40.8335, long: 14.3005,
                 gender: .female, location: "Academy Gate", petType: .dog,
                 weight: "42 lbs", age: "3 years", friendliness: "Intelligent",
                 description: "Ruby is a very smart girl who learns commands in minutes. She's looking for a family who will engage her mind with training and puzzles. She already knows how to fetch by name!",
                 ownerName: "New Life Rescue", ownerImage: "shelter-dummy-3"),
                 
            Pets(name: "Toby",
                 photo: "dog-dummy-9",
                 lat: 40.8365, long: 14.2805,
                 gender: .male, location: "Via Galileo Ferraris", petType: .dog,
                 weight: "25 lbs", age: "6 years", friendliness: "Cuddly",
                 description: "Toby is a professional cuddler. He's a smaller dog who wants nothing more than to be on your lap or snuggled next to you. He's a bit older and would prefer a quiet home.",
                 ownerName: "Animal Home Foundation", ownerImage: "shelter-dummy-4"),
                 
            Pets(name: "Lola",
                 photo: "dog-dummy-10",
                 lat: 40.8415, long: 14.2905,
                 gender: .female, location: "Mercato Ittico", petType: .dog,
                 weight: "38 lbs", age: "1.5 years", friendliness: "Excitable",
                 description: "Lola is a happy, excitable pup who greets everyone with a wiggly body. She's still learning her manners and not to jump, but her enthusiasm for life is contagious. She loves everyone.",
                 ownerName: "Pet Ark Association", ownerImage: "shelter-dummy-5"),
                 
            Pets(name: "Rocky",
                 photo: "dog-dummy-11",
                 lat: 40.8395, long: 14.3095,
                 gender: .male, location: "Quartiere San Giovanni", petType: .dog,
                 weight: "65 lbs", age: "4 years", friendliness: "Strong",
                 description: "Rocky is a powerful dog with a heart of gold. He loves long runs and playing tug-of-war. He would be a perfect partner for a runner or hiker. He's very loyal to his family.",
                 ownerName: "Happy Paws", ownerImage: "shelter-dummy-1"),

            Pets(name: "Maya",
                 photo: "dog-dummy-12",
                 lat: 40.8315, long: 14.2865,
                 gender: .female, location: "Porto Esterno", petType: .dog,
                 weight: "52 lbs", age: "3 years", friendliness: "Graceful",
                 description: "Maya is a graceful and elegant dog. She's quiet in the house but loves to run free in a secure area. She's a bit shy, but very sweet and gentle once she knows you.",
                 ownerName: "Happy Paws Shelter", ownerImage: "shelter-dummy-1"),
                 
            Pets(name: "Finn",
                 photo: "dog-dummy-13",
                 lat: 40.8345, long: 14.2915,
                 gender: .male, location: "Centro Commerciale", petType: .dog,
                 weight: "30 lbs", age: "2 years", friendliness: "Scrappy",
                 description: "Finn is a scrappy little guy with a huge personality. He was found looking for snacks. He's confident, funny, and always up for an adventure. He's a big dog in a small package.",
                 ownerName: "Faithful Friend Center", ownerImage: "shelter-dummy-2"),

            Pets(name: "Chloe",
                 photo: "dog-dummy-14",
                 lat: 40.8370, long: 14.3070,
                 gender: .female, location: "Corso Protopisani", petType: .dog,
                 weight: "45 lbs", age: "4 years", friendliness: "Obedient",
                 description: "This Chloe is a very well-behaved and obedient girl. She seems to have had some training, as she walks perfectly on a leash and waits patiently for her food. She's a total sweetheart.",
                 ownerName: "New Life Rescue", ownerImage: "shelter-dummy-3"),
                 
            Pets(name: "Gus",
                 photo: "dog-dummy-15",
                 lat: 40.8480, long: 14.3000,
                 gender: .male, location: "Via Reggio Calabria", petType: .dog,
                 weight: "58 lbs", age: "5 years", friendliness: "Goofy",
                 description: "Gus is a big, goofy boy who doesn't know his own size. He loves to lean on his humans for pets and will roll over for a belly rub at any opportunity. He's just a big, lovable goofball.",
                 ownerName: "Animal Home Foundation", ownerImage: "shelter-dummy-4")
        ]
        self.pets = petsList.shuffled()
    }
}
