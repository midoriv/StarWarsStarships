//
//  RowView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 10/4/2022.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    let starship: Starship
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(starship.name)
                        .font(.headline)
                        .bold()
                    Text(starship.manufacturer)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Length: \(formatDouble(starship.length))")
                        .font(.callout)
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
            .padding(0)
            
            Divider()
        }
    }
}
