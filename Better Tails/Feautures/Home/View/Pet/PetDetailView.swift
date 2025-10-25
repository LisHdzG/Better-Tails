//
//  PetDetailView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 24/10/25.
//

import SwiftUI
import MapKit

struct PetDetailView: View {
    
    @EnvironmentObject var viewModel: PetsViewModel
    
    @State private var showingAdoptionRules = false
    @State private var showSuccessScreen = false
    @Environment(\.presentationMode) var presentationMode
    
    let pet: Pets
    
    private let imageHeight: CGFloat = 350
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    Image(pet.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: imageHeight, alignment: .top)
                        .clipped()
                        .containerRelativeFrame(.horizontal)
                    
                    VStack {
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack (spacing: 10) {
                                    Text(pet.name)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                     
                                    Image(pet.gender == .female ? .iconFemenine : .iconMars)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 14, height: 14)
                                        .foregroundStyle(.white)
                                        .padding(5)
                                        .background { Circle().fill(.gray.opacity(0.3)) }
                                }
                                 
                                Text(pet.location)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Button(action: { viewModel.toggleFavorite(for: pet) }) {
                                Image(systemName: pet.favorite ? "heart.fill" : "heart")
                                    .font(.title2)
                                    .foregroundStyle(.red)
                            }.buttonStyle(.glass)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        .padding(.bottom, 10)

                        HStack(spacing: 12) {
                             StatBox(title: "Weight", value: pet.weight)
                             StatBox(title: "Friendly", value: pet.friendliness)
                             StatBox(title: "Age", value: pet.age)
                         }
                         .padding(.horizontal, 24)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                        
                        HStack {
                            Image(pet.ownerImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(pet.ownerName)
                                    .font(.headline)
                                Text("Shelter")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            
                            Button(action: {
                                if let url = URL(string: "tel://+520122334455") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Image(systemName: "phone.fill")
                                    .font(.title3)
                            }
                            .buttonStyle(.glass)
                                     
                            Button(action: {
                                let phoneNumber = ("+001122334455").replacingOccurrences(of: "+", with: "")
                                if let url = URL(string: "https://wa.me/\(phoneNumber)") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Image(systemName: "message.fill")
                                    .font(.title3)
                            }
                            .buttonStyle(.glass)
                            
                            Button(action: {
                                let coordinate = pet.coordinate
                                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
                                mapItem.name = "\(pet.name)'s Location"
                                mapItem.openInMaps(launchOptions: [
                                    MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
                                ])
                            }) {
                                Image(systemName: "arrow.trianglehead.turn.up.right.diamond.fill")
                                    .font(.title3)
                            }
                            .buttonStyle(.glass)
                                                        // --- FIN DEL CAMBIO ---
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        
                        Divider()
                            .padding(.horizontal, 10)
                        
                        Text(pet.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                            .padding(.top, 10)
                        
                        if viewModel.petInAdoption == nil || viewModel.petInAdoption?.id != pet.id {
                            Button(action: { self.showingAdoptionRules = true }) {
                                Text("I want to adopt! 🐾")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .fontWeight(.bold)
                            }
                            .buttonStyle(.glass)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            .padding(.bottom, 50)
                        }
                    }
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .offset(y: -50)

                }
            }
            .ignoresSafeArea(edges: .top)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.title3.weight(.bold))
                    .foregroundColor(.primary)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(Circle())
            }
            .padding()
             
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showingAdoptionRules) {
            AdoptionRulesView(showSuccessScreen: $showSuccessScreen)
        }
        .fullScreenCover(isPresented: $showSuccessScreen) {
            AdoptionSuccessView(pet: pet)
                .environmentObject(viewModel)
        }
        .onChange(of: showSuccessScreen) { oldValue, newValue in
            if oldValue == true && newValue == false {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct StatBox: View {
    let title: String
    let value: String
     
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(value)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
