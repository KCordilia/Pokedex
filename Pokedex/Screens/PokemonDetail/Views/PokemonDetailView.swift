//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI
import ComposableArchitecture

struct PokemonDetailView: View {
    let store: StoreOf<PokemonDetailFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                switch viewStore.viewState {
                case .loading:
                    LoadingView()
                case .success(let pokemonDetail):
                    VStack(spacing: -20) {
                        DetailHeaderView(pokemonDetail: pokemonDetail)
                        DetailContentView(pokemonDetail: pokemonDetail)
                        Spacer()
                    }
                    .background(.ultraThinMaterial)
                    .background(
                        TypeColorMapper.getTypeColor(for: pokemonDetail.types.first?.name ?? "")
                    )
                    .edgesIgnoringSafeArea(.bottom)
                case .error(let errorMessage):
                    VStack {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                        Button("Retry") {
                            viewStore.send(.fetchPokemonDetails(id: viewStore.pokemonId))
                        }
                    }
                }
            }
            .onAppear {
                viewStore.send(.fetchPokemonDetails(id: viewStore.pokemonId))
            }
        }
    }
}

#Preview {
//    PokemonDetailView(pokemonId: 1)
}
