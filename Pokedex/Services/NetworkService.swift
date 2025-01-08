//
//  NetworkService.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation
import Apollo
import ApolloAPI

final class NetworkService {
    private let apolloClient: ApolloClient
    
    init() {
        guard let url = URL(string: "https://beta.pokeapi.co/graphql/v1beta") else { fatalError("Invalid URL") }
        self.apolloClient = ApolloClient(url: url)
    }
    
    func fetch<T: GraphQLQuery>(query: T) async throws -> T.Data {
        try await withCheckedThrowingContinuation { continuation in
            apolloClient.fetch(query: query, cachePolicy: .returnCacheDataElseFetch) { result in
                switch result {
                case .success(let value):
                    if let data = value.data {
                        continuation.resume(returning: data)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

