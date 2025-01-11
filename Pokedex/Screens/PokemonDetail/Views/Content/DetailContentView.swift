//
//  DetailContentView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 11/12/2024.
//

import SwiftUI

struct DetailContentView: View {
    let pokemonDetail: PokemonDetail
    @State private var selectedSegment: DetailSegment = .about

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                VStack(spacing: 8) {
                    SegmentedControlView(
                        segments: DetailSegment.allCases.map {$0.rawValue},
                        selectedIndex: Binding(
                            get: { DetailSegment.allCases.firstIndex(of: selectedSegment) ?? 0},
                            set: { selectedSegment = DetailSegment.allCases[$0] }
                        )
                    )

                    switch selectedSegment {
                    case .about:
                        AboutView(pokemonDetail: pokemonDetail)
                            .frame(maxWidth: .infinity)
                    case .baseStats:
                        BaseStatsView(pokemonDetail: pokemonDetail)
                    case .moves:
                        MovesView()
                    }
                }
                .padding()
                .padding(.top, 40)
                .padding(.bottom)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.top, 150)
            .background(
                HStack {
                    Spacer()
                    Image("pokeball")
                        .resizable()
                        .frame(width: 175, height: 175)
                        .opacity(0.2)
                        .offset(x: 20, y: -65)
                        .position(x: 300, y: 150)
                }
            )
            PokemonImageView(url: pokemonDetail.spriteUrl)
        }
    }
}

#Preview {
    DetailContentView(pokemonDetail: MockData.createSamplePokemonDetail())
        .background(Color.orange)
}
