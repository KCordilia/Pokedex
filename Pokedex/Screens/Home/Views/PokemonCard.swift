//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Karim Cordilia on 20/11/2024.
//

import SwiftUI

struct PokemonCard: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 12, weight: .semibold))
                ForEach(viewModel.getTypes(for: pokemon), id: \.type.name) { type in
                    Text(type.name)
                }
                .padding(5)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(.capsule)
                
            }
            VStack {
                AsyncImage(url: pokemon.spriteUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                } placeholder: {
                    ProgressView()
                        .frame(width: 75, height: 75)
                }
                
            }
        }
        .frame(width: 150, height: 100)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    let mockViewModel = MockData.createMockHomeViewModel()
    
    PokemonCard(pokemon: MockData.createSamplePokemon())
        .environmentObject(mockViewModel)
}
