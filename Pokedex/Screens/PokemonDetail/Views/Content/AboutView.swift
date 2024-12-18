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
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 30) {
                Text("Height")
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
                    .frame(width: 80, alignment: .leading)
                Text("\(pokemonDetail.height) cm")
                    .font(.system(size: 13))
            }
            HStack(spacing: 30) {
                Text("Weight")
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
                    .frame(width: 80, alignment: .leading)
                Text("\(pokemonDetail.weight) kg")
                    .font(.system(size: 13))
            }
            
            HStack(spacing: 30) {
                Text("Abilities")
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
                    .frame(width: 80, alignment: .leading)
                Text(pokemonDetail.abilities.map { $0.ability.name.capitalized }.joined(separator: ", "))
                    .font(.system(size: 13))
            }
            
        }
//        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AboutView(pokemonDetail: MockData.createSamplePokemonDetail())
}
