//
//  Mocks.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import Foundation

@MainActor
struct MockData {    
    static func createSamplePokemon() -> Pokemon {
        return Pokemon(
            id: 1,
            name: "Charmeleon",
            sprites: .init(sprites: ""),
            types: []
        )
    }
    
    static func createSampleTypes() -> [PokemonTypes] {
        return [
            .init(
                type: .init(
                    name: "fire"
                    )
            ),
            .init(
                type: .init(
                    name: "Poison"
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
                        name: "Fire"
                    )
                )
            ], sprites: PokemonSprites(sprites: ""),
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
            ),
            flavorText: ""
        )
    }
    
    static func createMockSegments() -> [String] {
        return ["About", "Base Stats", "Moves"]
    }
}
