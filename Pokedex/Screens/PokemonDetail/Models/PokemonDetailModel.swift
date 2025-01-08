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
    let cries: Cry
    let flavorText: String
    
    var spriteUrl: URL? {
        URL(string: sprites.sprites)
    }
}

struct PokemonTypes: Codable {
    let type: PokemonType
    
    var name: String {
        return type.name
    }
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
}

struct Stat: Codable {
    let name: String
}

struct Cry: Codable {
    let latest: URL?
}

enum DetailSegment: String, CaseIterable {
    case about = "About"
    case baseStats = "Base Stats"
    case moves = "Moves"
}

extension PokemonDetail {
    var formattedHeight: String {
        let heightInMeters = Double(height) / 10.0
        return String(format: "%.1f m", heightInMeters)
    }
    
    var formattedWeight: String {
        let weightInKilograms = Double(weight) / 10.0
        return String(format: "%.1f kg", weightInKilograms)
    }
}
