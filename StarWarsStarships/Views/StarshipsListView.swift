//
//  StarshipsListView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 8/4/2022.
//

import SwiftUI

struct StarshipsListView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var showingSortOptions = false
    
    var body: some View {
        Group {
            switch viewModel.loadState {
            case .idle, .loading:
                ProgressView("Loading...")
                
            case .loaded:
                List {
                    ForEach(viewModel.starships, id: \.url) { starship in
                        NavigationLink(destination: DetailView(starship: viewModel.getStarshipByUrl(url: starship.url))) {
                            RowView(starship: starship)
                        }
                    }
                }
                .navigationBarItems(trailing: sortPicker)
                
            case .failed:
                VStack(spacing: 20) {
                    Text("Loading Failed.")
                    Button(action: {
                        Task {
                            await viewModel.loadStarships()
                        }
                    }) {
                        Text("Try again")
                    }
                }
            }
        }
        .navigationTitle("Starships")
        .task {
            await viewModel.loadStarships()
        }
    }
    
    var sortPicker: some View {
        HStack {
            Image(systemName: "arrow.up.arrow.down")
            Picker("Sort by", selection: $viewModel.sortOption) {
                ForEach(viewModel.sortOptions, id: \.self) { option in
                    HStack {
                        Text(option).font(.callout)
                    }
                }
            }
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
                if viewModel.isFavourite(starship) {
                    viewModel.deleteFavourite(starship)
                }
                else {
                    viewModel.addFavourite(starship)
                }
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
