//
//  AboutView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/12/2024.
//

import SwiftUI

struct AboutView: View {
    let pokemonDetail: PokemonDetail
    private let cryPlayer = PokemonCryPlayer()
    
    var body: some View {
        VStack {
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
            PlayButton(typeColor: pokemonDetail.types.first?.name ?? "") {
                if let url = pokemonDetail.cries.latest {
                    cryPlayer.playCry(from: url)
                }
            }
        }
    }
}

#Preview {
    AboutView(pokemonDetail: MockData.createSamplePokemonDetail())
}
