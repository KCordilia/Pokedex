//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/11/2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: PokemonListFeature.State()) {PokemonListFeature()
                }
            )
        }
    }
}
