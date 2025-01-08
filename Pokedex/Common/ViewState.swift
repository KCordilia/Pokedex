//
//  ViewState.swift
//  Pokedex
//
//  Created by Karim Cordilia on 07/01/2025.
//

import Foundation

enum ViewState<T> {
    case loading
    case succes(T)
    case error(String)
}
