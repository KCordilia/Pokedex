//
//  NetworkService.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import Foundation
import Apollo
import ApolloAPI
import Dependencies

extension DependencyValues {
    var networkService: NetworkServiceProtocol {
        get { self[NetworkServiceKey.self] }
        set { self[NetworkServiceKey.self] = newValue }
    }
}

private enum NetworkServiceKey: DependencyKey {
    static var liveValue: NetworkServiceProtocol = NetworkService()
    static var testValue: NetworkServiceProtocol = MockNetworkService(checkQuery: { _ in })
}

protocol NetworkServiceProtocol {
    func fetch<T: GraphQLQuery>(query: T) async throws -> T.Data
}

final class NetworkService: NetworkServiceProtocol {
    private let apolloClient: ApolloClient
    
    init() {
        let apiUrl = ProcessInfo.processInfo.environment["API_URL"] ?? ""
        guard let url = URL(string: apiUrl) else { fatalError("Invalid URL") }
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
