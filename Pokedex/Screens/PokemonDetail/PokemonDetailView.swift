//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    let types: [PokemonTypes]
    
    var body: some View {
        DetailHeaderView(pokemon: pokemon, types: types)
    }
}

#Preview {
    PokemonDetailView(pokemon: MockData.createSamplePokemon(), types: MockData.createSampleTypes())
}
