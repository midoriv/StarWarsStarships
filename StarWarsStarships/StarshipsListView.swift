//
//  StarshipsListView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct StarshipsListView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.starships, id: \.url) { starship in
                    NavigationLink(destination: DetailView(starship: viewModel.getStarshipByUrl(url: starship.url))) {
                        RowView(starship: starship)
                    }
                }
            }
            .task {
                await viewModel.loadStarships()
            }
            .navigationTitle("Starships")
        }
    }
}

struct RowView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    private(set) var starship: Starship
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(starship.name)")
                Text("Model: \(starship.model)")
                Text("Manufacturer: \(starship.manufacturer)")
            }
            
            Spacer()
            
            Button(action: {
                viewModel.addFavourite(starship)
            }) {
                if viewModel.favourites.contains { $0.url == starship.url } {
                    Image(systemName: "heart.fill")
                }
                else {
                    Image(systemName: "heart")
                }
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarshipsListView()
//    }
//}
