//
//  HomeView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 19/11/2024.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            switch viewModel.viewState {
            case .loading:
                LoadingView()
            case .succes(let pokemons):
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(pokemons, id: \.name) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemonId: pokemon.id)) {
                                PokemonCard(pokemon: pokemon)
                            }
                        }
                    }
                    .padding()
                    
                }
            case .error:
                Rectangle()
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchPokemons()
            }
        }
        .environmentObject(viewModel)
        .navigationTitle("Pokedex")
    }
}

#Preview {
    HomeView()
}
