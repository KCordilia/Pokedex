//
//  PokemonDetailMapper.swift
//  Pokedex
//
//  Created by Karim Cordilia on 07/01/2025.
//

import Foundation
import Pokeapi

struct PokemonDetailMapper {
    static func map(from pokeapi: [GetPokemonDetailsQuery.Data.Pokemon_v2_pokemon]) -> PokemonDetail? {
        guard let pokemonData = pokeapi.first else { return nil }
        guard let sprite = pokemonData.pokemon_v2_pokemonsprites.first?.sprites,
              let cry = pokemonData.pokemon_v2_pokemoncries.first?.cries,
              let flavorText = pokemonData.pokemon_v2_pokemonspecy?.pokemon_v2_pokemonspeciesflavortexts.first?.flavor_text else { return nil }
        let pokemonTypes = pokemonData.pokemon_v2_pokemontypes.map { PokemonTypes(type: PokemonType(name: $0.pokemon_v2_type?.name ?? ""))}
        let abilities = pokemonData.pokemon_v2_pokemonabilities.map { Ability(ability: BaseAbility(name: $0.pokemon_v2_ability?.name ?? ""))}
        let stats = pokemonData.pokemon_v2_pokemonstats.map { BaseStat(baseStat: $0.base_stat, stat: Stat(name: $0.pokemon_v2_stat?.name ?? ""))}
        guard let cryUrl = URL(string: cry) else {
            return nil
        }
        
        return PokemonDetail(
            id: pokemonData.id,
            name: pokemonData.name,
            types: pokemonTypes,
            sprites: PokemonSprites(sprites: sprite),
            abilities: abilities,
            stats: stats,
            height: pokemonData.height ?? 0,
            weight: pokemonData.weight ?? 0,
            cries: Cry(latest: cryUrl),
            flavorText: flavorText
            
        )
    }
    
}
