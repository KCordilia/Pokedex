//
//  DetailHeaderView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 09/12/2024.
//

import SwiftUI

struct DetailHeaderView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(pokemonDetail.name.capitalized)
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundColor(.white)
                
                HStack {
                    ForEach(pokemonDetail.types, id: \.type.name) { type in
                        TypeView(type: type.name)
                    }
                }
            }
            
            Spacer()
            
            Text(addLeadingZeros(to: pokemonDetail.id))
                .font(.system(.largeTitle, weight: .bold))
                .foregroundColor(.white.opacity(0.5))
        }
        .padding()
    }
    
    // MARK: - Helper Function
    private func addLeadingZeros(to id: Int) -> String {
        String(format: "#%03d", id)
    }
}

#Preview {
    DetailHeaderView(pokemonDetail: MockData.createSamplePokemonDetail())
        .background(Color.orange)
}
