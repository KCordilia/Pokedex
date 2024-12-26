//
//  AboutModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 26/12/2024.
//

import Foundation

struct PokemonSpecies: Codable {
    let flavorTextEntries: [FlavorTextEntry]
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
    
}

struct FlavorTextEntry: Codable {
    let flavorText: String
    let language: FlavorTextLanguage
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct FlavorTextLanguage: Codable {
    let name: String
}
