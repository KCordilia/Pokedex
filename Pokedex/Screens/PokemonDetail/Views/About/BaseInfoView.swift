//
//  BaseInfoView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 26/12/2024.
//

import SwiftUI

struct BaseInfoView: View {
    let imageName: String
    let statValue: String
    let statLabel: String
    var isRotated: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .frame(width: 16, height: 16)
                    .rotationEffect(.degrees(isRotated ? 90 : 0))
                
                Text(statValue)
                    .font(.system(size: 15))
            }
            PokemonInfoHeaderText(statLabel)
        }
        .padding()
    }
}

#Preview {
    BaseInfoView(imageName: "scalemass", statValue: "6.9 kg", statLabel: "Weight")
    BaseInfoView(imageName: "ruler", statValue: "0.7 m", statLabel: "Height", isRotated: true)
}
