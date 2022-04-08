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
                // TODO: add to the favourites
            }) {
                Image(systemName: "heart")
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarshipsListView()
//    }
//}
