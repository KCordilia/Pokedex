//
//  DetailHeaderView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 09/12/2024.
//

import SwiftUI

struct DetailHeaderView: View {
    let pokemon: Pokemon
    let types: [PokemonTypes]
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundColor(Color.white)
                ForEach(types, id:\.type.name) { type in
                    TypeView(type: type.name)
                    
                }
            }
            .padding()
            Spacer()
            Text(addLeadingZeros(to: pokemon.id))
                .font(.system(.title2, weight: .light))
                .foregroundColor(Color.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .background(TypeColorMapper.getTypeColor(for: types.first?.name ?? ""))
        Spacer()
        
    }
    
    private func addLeadingZeros(to id: Int) -> String {
        return String(format: "#%03d", id)
    }
}

#Preview {
    DetailHeaderView(pokemon: MockData.createSamplePokemon(), types: MockData.createSampleTypes())
}
