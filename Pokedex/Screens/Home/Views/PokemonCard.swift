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
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color.white)
                ForEach(viewModel.getTypes(for: pokemon), id: \.type.name) { type in
                    TypeView(type: type.name)
                }
            }
            
            Image("pokeball")
                .resizable()
                .frame(width: 70, height: 70)
                .opacity(0.1)
                .offset(x: 10, y: 15)
                .overlay {
                    AsyncImage(url: pokemon.spriteUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:10, y: 15)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 75, height: 75)
                    }
                }
        }
        .frame(width: 175, height: 110)
        .background(.ultraThinMaterial)
        .background(TypeColorMapper.getTypeColor(for: viewModel.getTypes(for: pokemon).first?.name ?? ""))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    let mockViewModel = MockData.createMockHomeViewModel()
    
    PokemonCard(pokemon: MockData.createSamplePokemon())
        .environmentObject(mockViewModel)
}
