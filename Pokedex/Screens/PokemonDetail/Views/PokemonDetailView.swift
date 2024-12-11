//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel = PokemonDetailViewModel()
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: -20) {
            if let pokemonDetail = viewModel.pokemonDetail {
                DetailHeaderView(pokemonDetail: pokemonDetail)
                DetailContentView(pokemonDetail: pokemonDetail)
            }
            Spacer()
        }
        .onAppear {
            Task {
                await viewModel.fetchPokemonDetails(for: pokemon.name)
            }
        }
        .background(.ultraThinMaterial)
        .background(TypeColorMapper.getTypeColor(for: viewModel.pokemonDetail?.types.first?.name ?? ""))
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    PokemonDetailView(
        pokemon: MockData.createSamplePokemon()
    )
}
