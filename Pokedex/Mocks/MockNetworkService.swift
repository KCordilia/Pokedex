//
//  MockNetworkService.swift
//  PokedexTests
//
//  Created by Karim Cordilia on 15/01/2025.
//

import Foundation
import Apollo
import ApolloAPI
import Pokeapi

struct MockNetworkService: NetworkServiceProtocol {
    struct MockWrongTypeError: Error { }

    var checkQuery: (any GraphQLQuery) -> Void = { _ in }
    var successResponse: Any?
    var failureResponse: Error?

    func fetch<T: GraphQLQuery>(query: T) async throws -> T.Data {
            checkQuery(query)
            if let failureResponse {
                throw failureResponse
            } else if let response = successResponse as? T.Data {
                return response
            } else {
                throw MockWrongTypeError()
            }
        }
}
