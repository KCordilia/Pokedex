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
            Pokemon(name: "Charmeleon", url: URL(string: "https://pokeapi.co/api/v2/pokemon/5/")!)
        ]
        
        mockViewModel.pokemonDetail = [
            "Charmeleon": PokemonDetail(
                id: 5, types: [
                    PokemonTypes(type: PokemonType(name: "Fire", url: URL(string: "https://pokeapi.co/api/v2/type/12/")!))
                ],
                sprites: PokemonSprites(
                    front_default: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")!
                )
            )
        ]
        
        return mockViewModel
    }
    
    static func createSamplePokemon() -> Pokemon {
        return Pokemon(name: "Charmeleon", url: URL(string: "https://pokeapi.co/api/v2/pokemon/5/")!)
    }
    
    static func createSampleTypes() -> [PokemonTypes] {
        return [.init(type: .init(name: "fire", url: URL(string: "https://pokeapi.co/api/v2/type/10/")!))]
    }
}
