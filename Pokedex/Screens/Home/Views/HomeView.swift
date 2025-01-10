//
//  HomeView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 19/11/2024.
//

import SwiftUI
import Lottie
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<PokemonListFeature>
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                    if viewStore.isLoading {
                        LoadingView()
                    } else {
                        ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(viewStore.pokemons, id: \.name) { pokemon in
                                NavigationLink(destination: PokemonDetailView(pokemonId: pokemon.id)) {
                                    PokemonCard(pokemon: pokemon)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewStore.send(.fetchPokemons)
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    HomeView(
        store: Store(
            initialState: PokemonListFeature.State()) {
                PokemonListFeature()
            }
    )
}
