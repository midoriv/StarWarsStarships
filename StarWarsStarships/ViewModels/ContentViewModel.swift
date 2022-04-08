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
    @Published private(set) var loadState: LoadState = .idle
    private let url = URL(string: "https://swapi.dev/api/starships/")!
    
    // MARK: - Intents
    
    func loadStarships() async {
        loadState = .loading
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let page = try JSONDecoder().decode(StarshipPage.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.starships = page.results
                self?.loadState = .loaded
            }
        }
        catch {
            // handle error
            DispatchQueue.main.async { [weak self] in
                self?.loadState = .failed(error)
                print("Error: \(error)")
            }
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
    
    func isFavourite(_ starship: Starship) -> Bool {
        return favourites.contains(starship)
    }
    
    func addFavourite(_ starship: Starship) {
        favourites.append(starship)
    }
    
    func deleteFavourite(_ starship: Starship) {
        favourites = favourites.filter{ $0.url != starship.url }
    }
}

enum LoadState {
    case idle
    case loading
    case failed(Error)
    case loaded
}

