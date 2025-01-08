//
//  PokemonInfoHeaderText.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/12/2024.
//

import SwiftUI

struct PokemonInfoHeaderText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 13))
            .foregroundColor(Color.gray)
    }
}

#Preview {
    PokemonInfoHeaderText("Height")
}
