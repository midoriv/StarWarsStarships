//
//  DetailView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    let starship: Starship
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    DetailInfoItemView(title: "Name:", value: starship.name)
                    DetailInfoItemView(title: "Starship Class:", value: starship.starshipClass)
                    DetailInfoItemView(title: "Model:", value: starship.model)
                    DetailInfoItemView(title: "Manufacturer:", value: starship.manufacturer)
                    DetailInfoItemView(title: "Cost in Credits:", value: starship.costInCredits)
                }
                
                VStack {
                    DetailInfoItemView(title: "Length:", value: formatDouble(starship.length))
                    DetailInfoItemView(title: "Max Atmosphering Speed:", value: starship.maxAtmospheringSpeed)
                    DetailInfoItemView(title: "Crew:", value: starship.crew)
                    DetailInfoItemView(title: "Passengers:", value: starship.passengers)
                    DetailInfoItemView(title: "Cargo Capacity:", value: starship.cargoCapacity)
                    DetailInfoItemView(title: "Consumables:", value: starship.consumables)
                    DetailInfoItemView(title: "Hyperdrive Rating:", value: starship.hyperdriveRating)
                    DetailInfoItemView(title: "MGLT:", value: starship.MGLT)
                }
                
                VStack {
                    DetailInfoItemView(title: "Created:", value: starship.created)
                    DetailInfoItemView(title: "Edited:", value: starship.edited)
                    DetailInfoItemView(title: "URL:", value: starship.url)
                }
            }
            .padding(.bottom, 20)
        }
        .navigationTitle(starship.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
