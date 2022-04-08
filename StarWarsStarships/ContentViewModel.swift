//
//  ContentViewModel.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published private(set) var starships = [Starship]()
    @Published private(set) var favourites = [Starship]()
    private let url = URL(string: "https://swapi.dev/api/starships/")!
    
    // MARK: - Intents
    
    func loadStarships() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let page = try JSONDecoder().decode(StarshipPage.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.starships = page.results
            }
        }
        catch {
            // handle error
        }
    }
    
    func getStarshipByUrl(url: String) -> Starship? {
        for starship in starships {
            if starship.url.elementsEqual(url) {
                return starship
            }
        }
        return nil
    }
    
    func addFavourite(_ starship: Starship) {
        if !favourites.contains(starship) {
            favourites.append(starship)
        }
    }
}

struct StarshipPage: Codable {
    var count: Int
    var next: String?
    var results: [Starship]
}

struct Starship: Hashable, Codable {
    var name: String
    var model: String
    var manufacturer: String
    var cost_in_credits: String
    var length: String
    var max_atmosphering_speed: String
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumables: String
    var hyperdrive_rating: String
    var MGLT: String
    var starship_class: String
    var pilots: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}

