//
//  DetailContentView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 11/12/2024.
//

import SwiftUI

struct DetailContentView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Text("Overlay Content")
                        .font(.headline)
                    Text("Additional Info")
                        .font(.body)
                    Text("Additional Info")
                        .font(.body)
                }
                .padding()
                .padding(.top, 40)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
            }
                .padding(.top, 150) // Adjust to control overlap dynamically
            
            AsyncImage(url: pokemonDetail.sprites.other.officialArtwork.front_default) { image in
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
}

#Preview {
    DetailContentView(pokemonDetail: MockData.createSamplePokemonDetail())
        .background(Color.orange)
}
