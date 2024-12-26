//
//  AbilitiesView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 26/12/2024.
//

import SwiftUI

struct AbilitiesView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        VStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(pokemonDetail.abilities, id: \.ability.name) { ability in
                        Text(ability.ability.name.capitalized)
                            .font(.system(size: 13))
                    }
                }
            PokemonInfoHeaderText("Moves")
        }
        .padding()
    }
}

#Preview {
    AbilitiesView(pokemonDetail: MockData.createSamplePokemonDetail())
}
