//
//  ErrorStateView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 05/02/2025.
//

import SwiftUI

struct ErrorStateView: View {
    let message: String

    var body: some View {
        ContentUnavailableView(
            "Something went wrong",
            systemImage: "exclamationmark.triangle.fill",
            description: Text(message)
        )
    }
}

#Preview {
    ErrorStateView(message: "test")
}
