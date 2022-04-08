//
//  StarWarsStarshipsApp.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

@main
struct StarWarsStarshipsApp: App {
    var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
