//
//  AboutViewModel.swift
//  Pokedex
//
//  Created by Karim Cordilia on 26/12/2024.
//

import Foundation

@MainActor
class AboutViewModel: ObservableObject {
    @Published var pokemonSpecies: PokemonSpecies?
    private let networkService = NetworkService()
    
    func fetchPokemonSpeciesInfo(for id: Int) async {
        do {
            pokemonSpecies = try await networkService.fetchData(from: .getPokemonSpecies(id), as: PokemonSpecies.self)
        } catch {
            print("failed to fetch pokemon species info: \(error.localizedDescription)")
        }
    }
    
    func getFlavorText() -> String {
        let formattedText = pokemonSpecies?.flavorTextEntries.first(where: {$0.language.name == "en"})?.flavorText.replacingOccurrences(of: "\n", with: " ") ?? ""
        return formattedText
    }
}
