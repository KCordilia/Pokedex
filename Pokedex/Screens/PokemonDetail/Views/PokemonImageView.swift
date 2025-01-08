//
//  PokemonImageView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 16/12/2024.
//

import SwiftUI

struct PokemonImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            if let image = image.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .shadow(radius: 10)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    PokemonImageView(url: URL(string: "www.google.com")!)
}
