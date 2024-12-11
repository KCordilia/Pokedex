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
