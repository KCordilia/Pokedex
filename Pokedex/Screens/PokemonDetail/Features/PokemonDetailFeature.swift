//
//  PokemonDetailFeature.swift
//  Pokedex
//
//  Created by Karim Cordilia on 10/01/2025.
//

import ComposableArchitecture
import Pokeapi

@Reducer
struct PokemonDetailFeature {
    @Dependency(\.networkService) var networkService

    @ObservableState
    struct State: Equatable {
        var viewState: ViewState<PokemonDetail> = .loading
        var pokemonId: Int
    }

    enum Action: Equatable {
        case fetchPokemonDetails(id: Int)
        case fetchPokemonDetailResponse(TaskResult<PokemonDetail>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchPokemonDetails(let id):
                state.viewState = .loading
                return .run { send in
                    do {
                        let query = GetPokemonDetailsQuery(id: id)
                        let data = try await networkService.fetch(query: query)
                        guard let pokemonDetail = PokemonDetailMapper.map(from: data.pokemon_v2_pokemon) else { return }
                        await send(.fetchPokemonDetailResponse(.success(pokemonDetail)))
                    } catch {
                        await send(.fetchPokemonDetailResponse(.failure(error)))
                    }
                }
            case .fetchPokemonDetailResponse(let result):
                switch result {
                case .success(let pokemonDetail):
                    state.viewState = .success(pokemonDetail)
                case .failure(let error):
                    state.viewState = .error(error.localizedDescription)
                }
                return .none
            }
        }
    }
}
