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
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    
                    Text(pokemon.name.capitalized)
                        .font(.system(.largeTitle, weight: .bold))
                        .foregroundColor(Color.white)
                    
                    HStack {
                        ForEach(types, id:\.type.name) { type in
                            TypeView(type: type.name)
                        }
                    }
                }
                
                Spacer()
                
                Text(addLeadingZeros(to: pokemon.id))
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundColor(Color.white)
                    .opacity(0.5)
            }
            
            AsyncImage(url: pokemon.spriteUrl) { image in
                image
                    .image?.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(y: 25)
            }
        }
        .padding([.top, .leading, .trailing])
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
