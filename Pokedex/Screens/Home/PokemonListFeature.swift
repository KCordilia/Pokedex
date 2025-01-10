//
//  PokemonListFeature.swift
//  Pokedex
//
//  Created by Karim Cordilia on 09/01/2025.
//

import Foundation
import Pokeapi
import ComposableArchitecture

@Reducer
struct PokemonListFeature {
    @Dependency(\.networkService) var networkService
    
    @ObservableState
    struct State: Equatable {
        var pokemons: [Pokemon] = []
        var isLoading: Bool = false
        var errorMessage: String? = nil
    }
    
    enum Action {
        case fetchPokemons
        case fetchPokemonsResponse(TaskResult<[Pokemon]>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchPokemons:
                state.isLoading = true
                return .run { send in
                    do {
                        let query = GetAllPokemonsQuery()
                        let data = try await networkService.fetch(query: query)
                        let pokemons = PokemonMapper.map(from: data.pokemon_v2_pokemon)
                        await send(.fetchPokemonsResponse(.success(pokemons)))
                    } catch {
                        await send(.fetchPokemonsResponse(.failure(error)))
                    }
                    
                }
            case .fetchPokemonsResponse(let result):
                switch result {
                case .success(let pokemons):
                    state.pokemons = pokemons
                    state.isLoading = false
                case .failure(let error):
                    state.errorMessage = error.localizedDescription
                    state.isLoading = false
                }
                return .none
            }
        }
    }
}

