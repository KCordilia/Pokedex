//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Karim Cordilia on 04/01/2025.
//

import Foundation
import Pokeapi

struct PokemonMapper {
    static func map(from pokeapi: [GetAllPokemonsQuery.Data.Pokemon_v2_pokemon]) -> [Pokemon] {
        return pokeapi.compactMap { pokemonData in
            guard let sprite = pokemonData.pokemon_v2_pokemonsprites.first?.sprites
            else {
                return nil
            }
            let pokemonTypes = pokemonData.pokemon_v2_pokemontypes.map { PokemonType(name: $0.pokemon_v2_type?.name ?? "")}
            return Pokemon(
                id: pokemonData.id,
                name: pokemonData.name,
                sprites: PokemonSprites(sprites: sprite),
                types: pokemonTypes
            )
        }
    }
}
