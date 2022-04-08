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
                VStack {
                    Text("Name: \(starship.name)")
                    Text("Model: \(starship.model)")
                    Text("Manufacturer: \(starship.manufacturer)")
                    Text("URL: \(starship.url)")
                }
            }
            else {
                Text("Failed to obtain the starship.")
            }
        }
        .navigationTitle("Starship Details")
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
