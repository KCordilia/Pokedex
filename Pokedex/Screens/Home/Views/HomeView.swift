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
    @Bindable var store: StoreOf<PokemonListFeature>
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: \.path)) {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                VStack {
                    switch viewStore.viewState {
                    case .loading:
                        LoadingView()
                    case .success(let pokemons):
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(pokemons, id: \.name) { pokemon in
                                    NavigationLink(state: PokemonDetailFeature.State(pokemonId: pokemon.id)) {
                                        PokemonCard(pokemon: pokemon)
                                    }
                                }
                            }
                        }
                    case .error(let error):
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    }
                }
                .onAppear {
                    viewStore.send(.fetchPokemons)
                }
                .navigationTitle("Pokedex")
            }
        } destination: { store in
            PokemonDetailView(store: store)
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
