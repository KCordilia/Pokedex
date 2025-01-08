//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 11/12/2024.
//

import Foundation
import Pokeapi

@MainActor
class PokemonDetailViewModel: ObservableObject {
    @Published var viewState: ViewState<PokemonDetail> = .loading
    private let networkService = NetworkService()
    
    func fetchPokemonsDetails(id: Int) async {
        viewState = .loading
        do {
            let query = GetPokemonDetailsQuery(id: id)
            let data = try await networkService.fetch(query: query)
            if let pokemonDetail = PokemonDetailMapper.map(from: data.pokemon_v2_pokemon) {
                viewState = .succes(pokemonDetail)
            } else {
                viewState = .error("Failed to map pokemonDetail")
            }
        } catch {
            viewState = .error(error.localizedDescription)
        }
    }
}
