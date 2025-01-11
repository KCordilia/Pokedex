//
//  ViewState.swift
//  Pokedex
//
//  Created by Karim Cordilia on 07/01/2025.
//

import Foundation

enum ViewState<T: Equatable>: Equatable {
    case loading
    case success(T)
    case error(String)
}
