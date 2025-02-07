//
//  PokemonDetailFeatureTests.swift
//  PokedexTests
//
//  Created by Karim Cordilia on 03/02/2025.
//

import Testing
import ComposableArchitecture
import Apollo
import ApolloTestSupport
import Pokeapi

@testable import Pokedex

@MainActor
struct PokemonDetailFeatureTests {
    @Dependency(\.networkService) var networkService
    let pokemonId = 1

    @Test
    func viewStateIsLoading() async throws {
        let store = TestStore(initialState: PokemonDetailFeature.State(pokemonId: pokemonId)) {
            PokemonDetailFeature()
        }

        #expect(store.state.viewState == .loading)
    }

    @Test
    func fetchPokemonDetailsWithSuccessState() async throws {
        let data = try GetPokemonDetailsQuery.Data(data: MockData.singlePokemonDetailMockData)
        let mockNetworkService = MockNetworkService(checkQuery: { _ in }, successResponse: data)

        let store = TestStore(initialState: PokemonDetailFeature.State(pokemonId: pokemonId)) {
            PokemonDetailFeature()
        } withDependencies: {
            $0.networkService = mockNetworkService
        }

        await store.send(.fetchPokemonDetails(id: pokemonId))
        await store.receive(.fetchPokemonDetailResponse(.success(MockData.expectedSinglePokemonDetail))) {
            $0.viewState = .success(MockData.expectedSinglePokemonDetail)
        }
    }

    @Test
    func fetchPokemonDetailsWithErrorState() async throws {
        let mockNetworkService = MockNetworkService(checkQuery: { _ in }, failureResponse: MockData.MockError())
        
        let store = TestStore(initialState: PokemonDetailFeature.State(pokemonId: pokemonId)) {
            PokemonDetailFeature()
        } withDependencies: {
            $0.networkService = mockNetworkService
        }

        await store.send(.fetchPokemonDetails(id: pokemonId))
        await store.receive(.fetchPokemonDetailResponse(.failure(MockData.MockError()))) {
            $0.viewState = .error("Something went wrong")
        }
    }
}
