//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation
import Pokeapi
import Apollo

@MainActor
class HomeViewModel: ObservableObject {
    @Published var viewState: ViewState<[Pokemon]> = .loading
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPokemons() async {
        viewState = .loading
        do {
            let query = GetAllPokemonsQuery()
            let data = try await networkService.fetch(query: query)
            let pokemons = PokemonMapper.map(from: data.pokemon_v2_pokemon)
            viewState = .succes(pokemons)
        } catch {
            viewState = .error(error.localizedDescription)
        }
    }
    
    func getTypes(for pokemon: Pokemon) -> [PokemonType] {
        return pokemon.types
    }
}
