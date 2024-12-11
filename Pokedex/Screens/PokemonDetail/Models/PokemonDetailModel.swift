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
