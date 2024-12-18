//
//  AboutView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/12/2024.
//

import SwiftUI

struct AboutView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                PokemonInfoHeaderText("Height")
                PokemonInfoHeaderText("Weight")
                PokemonInfoHeaderText("Abilities")
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                PokemonInfoValueText("\(pokemonDetail.formattedHeight)")
                PokemonInfoValueText("\(pokemonDetail.formattedWeight)")
                PokemonInfoValueText(pokemonDetail.abilities.map { $0.ability.name.capitalized }.joined(separator: ", "))
            }
        }
        .padding()
    }
}

#Preview {
    AboutView(pokemonDetail: MockData.createSamplePokemonDetail())
}
