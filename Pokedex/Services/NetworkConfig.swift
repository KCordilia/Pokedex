//
//  NetworkConfig.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation

struct NetworkConfig {
    private static let baseUrlString = "https://pokeapi.co/api/v2"
    
    static func url(for path: String) -> URL? {
        guard let baseURL = URL(string: baseUrlString) else {
            print("Invalid base URL string")
            return nil
        }
        
        let url = baseURL.appendingPathComponent(path)
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "limit", value: "151")
        ]
        
        return urlComponents?.url
    }
}

enum APIEndpoint {
    case getPokemon
    case getPokemonDetail(String)
    case getImageUrl(Int)
    case getPokemonSpecies(Int)
    
    var url: URL? {
        switch self {
        case .getPokemon:
            return NetworkConfig.url(for: "/pokemon")
        case .getPokemonDetail(let name):
            guard let url = NetworkConfig.url(for: "/pokemon/\(name)") else { return nil }
            return URL(string: url.absoluteString)
        case .getImageUrl(let id):
            guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png") else { return nil }
            return url
        case .getPokemonSpecies(let id):
            return NetworkConfig.url(for: "/pokemon-species/\(id)")
        }
    }
}
