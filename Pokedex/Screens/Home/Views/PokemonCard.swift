//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Karim Cordilia on 20/11/2024.
//

import SwiftUI

struct PokemonCard: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color.white)
                ForEach(pokemon.types, id: \.name) { type in
                    TypeView(type: type.name)
                }
            }
            
            AsyncImage(url: pokemon.spriteUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
                    .frame(width: 75, height: 75)
            }
        }
        .frame(width: 175, height: 110)
        .background(
            HStack {
                Spacer()
                Image("pokeball")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .opacity(0.2)
                    .offset(x: 20, y: 20)
            }
        )
        .background(.ultraThinMaterial)
        .background(TypeColorMapper.getTypeColor(for: pokemon.types.first?.name ?? ""))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {    
    PokemonCard(pokemon: MockData.createSamplePokemon())
}
