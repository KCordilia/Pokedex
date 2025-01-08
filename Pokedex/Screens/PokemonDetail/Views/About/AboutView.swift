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
                BaseInfoView(imageName: "scalemass", statValue: pokemonDetail.formattedWeight, statLabel: "Weight")
                Divider()
                    .frame(height: 70)
                    .background(Color.gray)
                BaseInfoView(imageName: "ruler", statValue: pokemonDetail.formattedHeight, statLabel: "Height", isRotated: true)
                Divider()
                    .frame(height: 70)
                    .background(Color.gray)
                AbilitiesView(pokemonDetail: pokemonDetail)
            }
            
            Text(pokemonDetail.flavorText)
                .font(.system(size: 15))
                .padding(.bottom)

            
            PlayButton(typeColor: pokemonDetail.types.first?.name ?? "") {
                if let url = pokemonDetail.cries.latest {
                    cryPlayer.playCry(from: url)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AboutView(pokemonDetail: MockData.createSamplePokemonDetail())
}
