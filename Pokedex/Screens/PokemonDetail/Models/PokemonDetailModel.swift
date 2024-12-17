//
//  PokemonDetailModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 11/12/2024.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let types: [PokemonTypes]
    let sprites: PokemonSprites
    let abilities: [Ability]
    let stats: [BaseStat]
    let height: Int
    let weight: Int
}

struct PokemonSprites: Codable {
    let other: OtherSprites
}

struct OtherSprites: Codable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let front_default: URL
}


struct PokemonTypes: Codable {
    let type: PokemonType
    
    var name: String {
        return type.name
    }
}

struct PokemonType: Codable {
    let name: String
    let url: URL
}

struct Ability: Codable {
    let ability: BaseAbility
}

struct BaseAbility: Codable {
    let name: String
}

struct BaseStat: Codable {
    let baseStat: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat = "stat"
    }
}

struct Stat: Codable {
    let name: String
}

enum DetailSegment: String, CaseIterable {
    case about = "About"
    case baseStats = "Base Stats"
    case moves = "Moves"
}
