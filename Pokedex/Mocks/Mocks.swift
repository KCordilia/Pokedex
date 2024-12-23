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
        mockViewModel.pokemons = [Pokemon(name: "Charmeleon", url: URL(string: "https://pokeapi.co/api/v2/pokemon/5/")!)]
        mockViewModel.pokemonDetail = ["Charmeleon": createSamplePokemonDetail()]
        return mockViewModel
    }
    
    static func createSamplePokemon() -> Pokemon {
        return Pokemon(name: "Charmeleon", url: URL(string: "https://pokeapi.co/api/v2/pokemon/5/")!)
    }
    
    static func createSampleTypes() -> [PokemonTypes] {
        return [
            .init(
                type: .init(
                    name: "fire",
                    url: URL(
                        string: "https://pokeapi.co/api/v2/type/10/")!
                )
            ),
            .init(
                type: .init(
                    name: "Poison",
                    url: URL(string: "https://pokeapi.co/api/v2/type/10/")!
                )
            )
        ]
    }
    
    static func createSamplePokemonDetail() -> PokemonDetail {
        return PokemonDetail(
            id: 5,
            name: "Charmeleon",
            types: [
                PokemonTypes(
                    type: PokemonType(
                        name: "Fire",
                        url: URL(string: "https://pokeapi.co/api/v2/type/12/")!
                    )
                )
            ], sprites: PokemonSprites(
                other: OtherSprites(
                    officialArtwork: OfficialArtwork(
                        front_default: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png")!
                    )
                )
            ),
            abilities: [
                Ability(
                    ability: BaseAbility(
                        name: "blaze"
                    )
                ),
                Ability(
                    ability: BaseAbility(
                        name: "solar power"
                    )
                )
            ],
            stats: [
                BaseStat(
                    baseStat: 65,
                    stat: Stat(
                        name: "hp"
                    )
                ),
                BaseStat(
                    baseStat: 65,
                    stat: Stat(
                        name: "defense"
                    )
                ),
                BaseStat(
                    baseStat: 65,
                    stat: Stat(
                        name: "speed"
                    )
                )
            ],
            height: 7,
            weight: 69,
            cries: Cry(
                latest: URL(string: "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg")!
            )
        )
    }
    
    static func createMockSegments() -> [String] {
        return ["About", "Base Stats", "Moves"]
    }
}
