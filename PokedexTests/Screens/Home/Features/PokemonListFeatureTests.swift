//
//  PokemonListFeatureTests.swift
//  PokedexTests
//
//  Created by Karim Cordilia on 14/01/2025.
//

import Testing
import ComposableArchitecture
import Apollo
import ApolloTestSupport
import Pokeapi

@testable import Pokedex

@MainActor
struct PokemonListFeatureTests {
    @Dependency(\.networkService) var networkService

    @Test
    func viewStateIsLoading() async throws {
        let store = TestStore(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        }

        #expect(store.state.viewState == .loading)
    }

    @Test
    func fetchPokemonsWithSuccessState() async throws {
        let data = try GetAllPokemonsQuery.Data(data: MockData.singlePokemonMockData)

        let mockNetworkService = MockNetworkService(checkQuery: { _ in }, successResponse: data)
        let store = TestStore(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        } withDependencies: {
            $0.networkService = mockNetworkService
        }

        await store.send(.fetchPokemons)

        await store.receive(.fetchPokemonsResponse(.success(MockData.expectedSinglePokemon))) {
            $0.viewState = .success(MockData.expectedSinglePokemon)
        }
    }

    @Test
    func fetchPokemonWithErrorState() async throws {

        let mockNetworkService = MockNetworkService(checkQuery: { _ in }, failureResponse: MockData.MockError())
        let store = TestStore(initialState: PokemonListFeature.State()) {
            PokemonListFeature()
        } withDependencies: {
            $0.networkService = mockNetworkService
        }

        await store.send(.fetchPokemons)
        await store.receive(.fetchPokemonsResponse(.failure(MockData.MockError()))) {
            $0.viewState = .error("Something went wrong")
        }
    }
}
