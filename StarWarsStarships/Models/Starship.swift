//
//  Starship.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import Foundation

struct StarshipPage: Codable {
    var count: Int
    var next: String?
    var results: [Starship]
}

struct Starship: Hashable, Codable {
    var name: String
    var model: String
    var manufacturer: String
    var costInCredits: String
    var length: Double  // convert from String to use it for sorting
    var maxAtmospheringSpeed: String
    var crew: String
    var passengers: String
    var cargoCapacity: String
    var consumables: String
    var hyperdriveRating: String
    var MGLT: String
    var starshipClass: String
    var pilots: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.model = try container.decode(String.self, forKey: .model)
        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
        self.costInCredits = try container.decode(String.self, forKey: .costInCredits)
        
        let lengthStr = try container.decode(String.self, forKey: .length)
        self.length = Double(truncating: NumberFormatter().number(from: lengthStr) ?? 0)
        
        self.maxAtmospheringSpeed = try container.decode(String.self, forKey: .maxAtmospheringSpeed)
        self.crew = try container.decode(String.self, forKey: .crew)
        self.passengers = try container.decode(String.self, forKey: .passengers)
        self.cargoCapacity = try container.decode(String.self, forKey: .cargoCapacity)
        self.consumables = try container.decode(String.self, forKey: .consumables)
        self.hyperdriveRating = try container.decode(String.self, forKey: .hyperdriveRating)
        self.MGLT = try container.decode(String.self, forKey: .MGLT)
        self.starshipClass = try container.decode(String.self, forKey: .starshipClass)
        self.pilots = try container.decode([String].self, forKey: .pilots)
        self.films = try container.decode([String].self, forKey: .films)
        self.created = try container.decode(String.self, forKey: .created)
        self.edited = try container.decode(String.self, forKey: .edited)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
