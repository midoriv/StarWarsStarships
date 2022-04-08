//
//  ContentView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.starships, id: \.self) { starship in
                VStack(alignment: .leading) {
                    Text("Name: \(starship.name)")
                    Text("Model: \(starship.model)")
                    Text("Manufacturer: \(starship.manufacturer)")
                }
            }
        }
        .task {
            await viewModel.loadStarships()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
