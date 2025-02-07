//
//  EmptyStateView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 05/02/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView(
            "No Pokémon found",
            systemImage: "tray.fill",
            description: Text("It seems like there are no Pokémon available at the moment")
        )
    }
}

#Preview {
    EmptyStateView()
}
