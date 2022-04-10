//
//  DetailInfoItemView.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 10/4/2022.
//

import SwiftUI

struct DetailInfoItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).bold()
                Text(value)
            }
            Spacer()
        }
        .frame(minHeight: 60)
        .padding(.leading, 25)
    }
}
