//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.name)
    }
}

#Preview {
    PokemonDetailView(pokemon: MockData.createSamplePokemon())
}
