//
//  ContentViewModel.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published private(set) var starships = [Starship]()
    private let url = URL(string: "https://swapi.dev/api/starships/")!
    
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
}

