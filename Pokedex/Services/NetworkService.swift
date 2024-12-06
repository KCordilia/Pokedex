//
//  NetworkService.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation

final class NetworkService {
    
    func fetchData<T: Decodable>(from endpoint: APIEndpoint, as type: T.Type) async throws -> T {
        guard let url = endpoint.url else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(type, from: data)
        
        return decodedData
    }
}
