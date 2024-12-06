//
//  HomeView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 19/11/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.pokemons, id: \.name) { pokemon in
                    PokemonCard(pokemon: pokemon)
                }
            }
            .padding()
            
        }
        .onAppear() {
            Task {
                await viewModel.fetchPokemons()
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    HomeView()
}
