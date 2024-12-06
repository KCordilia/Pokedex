//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var pokemonDetail: [String: PokemonDetail] = [:]
    private let networkService = NetworkService()
    
    func fetchPokemons() async {
        do {
            pokemons = try await networkService.fetchData(from: .getPokemon, as: PokemonResult.self).results
            
            for pokemon in pokemons {
                let detail = try await networkService.fetchData(from: .getPokemonDetail(pokemon.name), as: PokemonDetail.self)
                pokemonDetail[pokemon.name] = detail
            }
        } catch {
            print("failed to fetch pokemon: \(error.localizedDescription)")
        }
    }
    
    func fetchPokemonImage(for id: Int) -> URL? {
        guard let url = APIEndpoint.getImageUrl(id).url else { return nil }
        return url
    }
    
    func getTypes(for pokemon: Pokemon) -> [PokemonTypes] {
        guard let types = pokemonDetail[pokemon.name]?.types else { return [] }
        return types
    }
}
