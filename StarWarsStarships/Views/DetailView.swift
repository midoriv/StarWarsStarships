//
//  DetailView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    var starship: Starship?
    
    var body: some View {
        Group {
            if let starship = starship {
                VStack(alignment: .leading) {
                    Group {
                        Text("Name: \(starship.name)")
                        Text("Model: \(starship.model)")
                        Text("Manufacturer: \(starship.manufacturer)")
                        Text("Cost in Credits: \(starship.costInCredits)")
                        Text("Length: \(formatDouble(starship.length))")
                        Text("Max Atmosphering Speed: \(starship.maxAtmospheringSpeed)")
                        Text("Crew: \(starship.crew)")
                        Text("Passengers: \(starship.passengers)")
                        Text("Cargo Capacity: \(starship.cargoCapacity)")
                        Text("Consumables: \(starship.consumables)")
                    }
                    Group {
                        Text("Hyperdrive Rating: \(starship.hyperdriveRating)")
                        Text("MGLT: \(starship.MGLT)")
                        Text("Starship Class: \(starship.starshipClass)")
                        
                        Text("Pilots:")
                        ForEach(starship.pilots, id: \.self) { pilot in
                            Text(pilot)
                        }
                        
                        Text("Films:")
                        ForEach(starship.films, id: \.self) { film in
                            Text(film)
                        }
                        
                        Text("Created: \(starship.created)")
                        Text("Edited: \(starship.edited)")
                        Text("URL: \(starship.url)")
                    }
                }
            }
            else {
                Text("Failed to obtain the starship.")
            }
        }
        .navigationTitle("Starship Details")
        .padding()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
