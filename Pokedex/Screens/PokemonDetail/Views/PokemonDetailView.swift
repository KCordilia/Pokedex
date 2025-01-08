//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var viewModel = PokemonDetailViewModel()
    var pokemonId: Int
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                LoadingView()
            case .succes(let pokemonDetail):
                VStack(spacing: -20) {
                    DetailHeaderView(pokemonDetail: pokemonDetail)
                    DetailContentView(pokemonDetail: pokemonDetail)
                    Spacer()
                }
                .background(.ultraThinMaterial)
                .background(TypeColorMapper.getTypeColor(for: pokemonDetail.types.first?.name ?? ""))
                .edgesIgnoringSafeArea(.bottom)
            case .error:
                Rectangle()
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchPokemonsDetails(id: pokemonId)
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemonId: 1)
}
