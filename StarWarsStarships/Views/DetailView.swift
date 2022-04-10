//
//  DetailView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct DetailInfoItemView: View {
    let title: String
    let value: String
    let geometry: GeometryProxy
    
    var body: some View {
        
            HStack {
                VStack(alignment: .leading) {
                    Text(title).bold()
                    Text(value)
                }
                Spacer()
            }
            .frame(width: geometry.size.width, height: 70)
    }
}

struct DetailView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    var starship: Starship?
    
    var body: some View {
        if let starship = starship {
            GeometryReader { geometry in
                ScrollView {
                    VStack() {
                        VStack() {
                            DetailInfoItemView(title: "Starship Class", value: starship.starshipClass, geometry: geometry)
                            DetailInfoItemView(title: "Model", value: starship.model, geometry: geometry)
                            DetailInfoItemView(title: "Manufacturer", value: starship.manufacturer, geometry: geometry)
                            DetailInfoItemView(title: "Cost in Credits", value: starship.costInCredits, geometry: geometry)
                        }
                        
                        VStack() {
                            DetailInfoItemView(title: "Length", value: formatDouble(starship.length), geometry: geometry)
                            DetailInfoItemView(title: "Max Atmosphering Speed", value: starship.maxAtmospheringSpeed, geometry: geometry)
                            DetailInfoItemView(title: "Crew", value: starship.crew, geometry: geometry)
                            DetailInfoItemView(title: "Passengers", value: starship.passengers, geometry: geometry)
                            DetailInfoItemView(title: "Cargo Capacity", value: starship.cargoCapacity, geometry: geometry)
                            DetailInfoItemView(title: "Consumables", value: starship.consumables, geometry: geometry)
                            DetailInfoItemView(title: "Hyperdrive Rating", value: starship.hyperdriveRating, geometry: geometry)
                            DetailInfoItemView(title: "MGLT", value: starship.MGLT, geometry: geometry)
                        }

                        
//                            VStack(alignment: .leading) {
//                                DetailInfoItemView(title: "Created", value: starship.created)
//                                DetailInfoItemView(title: "Edited", value: starship.edited)
//                                DetailInfoItemView(title: "URL", value: starship.url)
//                            }

                    }
                }
                .frame(maxWidth: .infinity)
                .navigationTitle(starship.name)
            }
        }
        else {
            Text("Failed to obtain the starship.")
                .navigationTitle("Starship Details")
        }
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
