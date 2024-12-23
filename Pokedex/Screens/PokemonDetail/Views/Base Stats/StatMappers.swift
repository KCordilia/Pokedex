//
//  StatMappers.swift
//  Pokedex
//
//  Created by Karim Cordilia on 23/12/2024.
//

import SwiftUI

struct StatColorMapper {
    static func getColor(for stat: String) -> Color {
        switch stat.lowercased() {
        case "hp": return Color.HP
        case "attack": return Color.attack
        case "defense": return Color.defense
        case "special-attack": return Color.specialAttack
        case "special-defense": return Color.specialDefense
        case "speed": return Color.speed
        default: return .gray
        }
    }
}

struct StatNameMapper {
    static func mapStatName(for stat: String) -> String {
        switch stat.lowercased() {
        case "hp": return "HP"
        case "attack": return "Attack"
        case "defense": return "Defense"
        case "special-attack": return "Sp. Atk"
        case "special-defense": return "Sp. Def"
        case "speed": return "Speed"
        default: return ""
        }
    }
}
