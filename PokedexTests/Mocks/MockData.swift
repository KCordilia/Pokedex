//
//  MockData.swift
//  PokedexTests
//
//  Created by Karim Cordilia on 29/01/2025.
//

import Foundation
@testable import Pokedex

struct MockData {
    static let singlePokemonMockData: [String: Any] = [
        "pokemon_v2_pokemon": [
            [
                "__typename": "pokemon_v2_pokemon",
                "name": "Bulbasaur",
                "id": 1,
                "pokemon_v2_pokemonsprites": [
                    [
                        "__typename": "pokemon_v2_pokemonsprites",
                        "sprites": "{\"front_default\": \"bulbasaur_sprite\"}"
                    ]
                ],
                "pokemon_v2_pokemontypes": [
                    [
                        "__typename": "pokemon_v2_pokemontype",
                        "pokemon_v2_type": [
                            "__typename": "pokemon_v2_type",
                            "name": "grass"
                        ]
                    ]
                ]
            ]
        ]
    ]

    static let expectedSinglePokemon: [Pokemon] = [
        Pokemon(
            id: 1,
            name: "Bulbasaur",
            sprites: PokemonSprites(
                sprites: "{\"front_default\": \"bulbasaur_sprite\"}"
            ),
            types: [PokemonType(
                name: "grass"
            )]
        )
    ]

    static let singlePokemonDetailMockData: [String: Any] = [
            "pokemon_v2_pokemon": [
                [
                    "__typename": "pokemon_v2_pokemon",
                    "name": "Bulbasaur",
                    "id": 1,
                    "height": 7,
                    "weight": 69,
                    "pokemon_v2_pokemonsprites": [
                        [
                            "__typename": "pokemon_v2_pokemonsprites",
                            "sprites": "{\"front_default\": \"bulbasaur_sprite\"}"
                        ]
                    ],
                    "pokemon_v2_pokemonspecy": [
                        "__typename": "pokemon_v2_pokemonspecy",
                        "pokemon_v2_pokemonspeciesflavortexts": [
                            [
                                "__typename": "pokemon_v2_pokemonspeciesflavortexts",
                                "flavor_text": "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon."
                            ]
                        ]
                    ],
                    "pokemon_v2_pokemonstats": [
                        [
                            "__typename": "pokemon_v2_pokemonstats",
                            "base_stat": 45,
                            "pokemon_v2_stat": [
                                "__typename": "pokemon_v2_stat",
                                "name": "hp"
                            ]
                        ]
                    ],
                    "pokemon_v2_pokemontypes": [
                        [
                            "__typename": "pokemon_v2_pokemontypes",
                            "pokemon_v2_type": [
                                "__typename": "pokemon_v2_type",
                                "name": "grass"
                            ]
                        ]
                    ],
                    "pokemon_v2_pokemonabilities": [
                        [
                            "__typename": "pokemon_v2_pokemonabilities",
                            "pokemon_v2_ability": [
                                "__typename": "pokemon_v2_ability",
                                "name": "overgrow"
                            ]
                        ]
                    ],
                    "pokemon_v2_pokemoncries": [
                        [
                            "__typename": "pokemon_v2_pokemoncries",
                            "cries": "https://example.com/bulbasaur-cry.mp3"
                        ]
                    ]
                ]
            ]
        ]

    static let expectedSinglePokemonDetail = PokemonDetail(
        id: 1,
        name: "Bulbasaur",
        types: [PokemonTypes(type: PokemonType(name: "grass"))],
        sprites: PokemonSprites(
            sprites: "{\"front_default\": \"bulbasaur_sprite\"}"
        ),
        abilities: [Ability(ability: BaseAbility(name: "overgrow"))],
        stats: [BaseStat(baseStat: 45, stat: Stat(name: "hp"))],
        height: 7,
        weight: 69,
        cries: Cry(latest: URL(string: "https://example.com/bulbasaur-cry.mp3")),
        flavorText: "A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon."
    )

    struct MockError: Error, LocalizedError, Equatable {
        var errorDescription: String? {
            return "Something went wrong"
        }
    }
}
