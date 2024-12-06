//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation

struct PokemonResult: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: URL
    
    var id: Int {
        Int(url.lastPathComponent) ?? 1
    }
    
    var spriteUrl: URL? {
        APIEndpoint.getImageUrl(id).url
    }
}

struct PokemonDetail: Codable {
    let types: [PokemonTypes]
    let sprites: PokemonSprites
}

struct PokemonSprites: Codable {
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
