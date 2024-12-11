//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 11/12/2024.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    private let networkService = NetworkService()
    
    func fetchPokemonDetails(for pokemonName: String) async {
        do {
            pokemonDetail = try await networkService.fetchData(from: .getPokemonDetail(pokemonName), as: PokemonDetail.self)
            
        } catch {
            print("failed to fetch pokemon details: \(error.localizedDescription)")
        }
    }
}
