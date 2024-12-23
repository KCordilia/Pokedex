//
//  BaseStatsView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/12/2024.
//

import SwiftUI

struct BaseStatsView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        VStack {
            ForEach(pokemonDetail.stats, id: \.stat.name) { stat in
                StatBarView(statName: stat.stat.name, percentage: CGFloat(stat.baseStat))
            }
        }
        .padding()
    }
}

#Preview {
    BaseStatsView(pokemonDetail: MockData.createSamplePokemonDetail())
}
