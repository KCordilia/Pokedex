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
        var viewState: ViewState<[Pokemon]> = .loading
        var path = StackState<PokemonDetailFeature.State>()
    }
    
    enum Action: Equatable {
        case fetchPokemons
        case fetchPokemonsResponse(TaskResult<[Pokemon]>)
        case path(StackAction<PokemonDetailFeature.State, PokemonDetailFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchPokemons:
                state.viewState = .loading
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
                    state.viewState = .success(pokemons)
                case .failure(let error):
                    state.viewState = .error(error.localizedDescription)
                }
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            PokemonDetailFeature()
        }
    }
}

