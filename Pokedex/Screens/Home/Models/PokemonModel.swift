//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation

struct Pokemon: Codable, Equatable {
    
    let id: Int
    let name: String
    let sprites: PokemonSprites
    let types: [PokemonType]
    
    var spriteUrl: URL? {
        URL(string: sprites.sprites)
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

struct PokemonSprites: Codable {
    let sprites: String
}

struct PokemonType: Codable {
    let name: String
}
