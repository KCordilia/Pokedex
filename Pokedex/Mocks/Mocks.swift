//
//  Mocks.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import Foundation

@MainActor
struct MockData {
    static func createMockHomeViewModel() -> HomeViewModel {
        let mockViewModel = HomeViewModel()
        
        mockViewModel.pokemons = [
            Pokemon(name: "Bulbasaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!)
        ]
        
        mockViewModel.pokemonDetail = [
            "Bulbasaur": PokemonDetail(
                types: [
                    PokemonTypes(type: PokemonType(name: "Grass", url: URL(string: "https://pokeapi.co/api/v2/type/12/")!)),
                    PokemonTypes(type: PokemonType(name: "Poison", url: URL(string: "https://pokeapi.co/api/v2/type/4/")!))
                ],
                sprites: PokemonSprites(
                    front_default: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
                )
            )
        ]
        
        return mockViewModel
    }
    
    static func createSamplePokemon() -> Pokemon {
        return Pokemon(name: "Bulbasaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!)
    }
}
