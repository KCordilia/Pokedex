//
//  TypeColorMapper.swift
//  Pokedex
//
//  Created by Karim Cordilia on 06/12/2024.
//

import SwiftUI

struct TypeColorMapper {
    static let typeColors: [String: Color] = [
        "bug": Color("bug"),
        "dark": Color("dark"),
        "dragon": Color("dragon"),
        "electric": Color("electric"),
        "fairy": Color("fairy"),
        "fighting": Color("fighting"),
        "fire": Color("fire"),
        "flying": Color("flying"),
        "ghost": Color("ghost"),
        "grass": Color("grass"),
        "ground": Color("ground"),
        "ice": Color("ice"),
        "normal": Color("normal"),
        "poison": Color("poison"),
        "psychic": Color("psychic"),
        "rock": Color("rock"),
        "steel": Color("steel"),
        "water": Color("water")
    ]
    
    static func getTypeColor(for typeName: String) -> Color {
        return typeColors[typeName.lowercased()] ?? Color.gray
    }
}
