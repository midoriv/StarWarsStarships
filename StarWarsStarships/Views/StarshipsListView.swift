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
                        NavigationLink(destination: DetailView(starship: starship)) {
                            RowView(starship: starship)
                        }
                        .listRowSeparator(.hidden)
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
                        Text(option)
                            .font(.callout)
                    }
                }
            }
        }
    }
}
