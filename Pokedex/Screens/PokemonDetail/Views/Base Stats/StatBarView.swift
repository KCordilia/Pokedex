//
//  StatBarView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 22/12/2024.
//

import SwiftUI

struct StatBarView: View {
    var statName: String
    var percentage: CGFloat

    var body: some View {
        HStack(spacing: 8) {
                Text(StatNameMapper.mapStatName(for: statName))
                .frame(width: 90, alignment: .leading)
                .font(.system(size: 13))
                .foregroundColor(.gray)
                Text("\(Int(percentage))")
                .frame(width: 30, alignment: .leading)
                .font(.system(size: 13))
                .foregroundColor(.black)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(StatColorMapper.getColor(for: statName))
                        .frame(width: geometry.size.width * (min(max(percentage, 0), 100) / 100), height: 6)
                }
            }
            .frame(height: 4)
        }
        .padding(.trailing)
    }
}

#Preview {
    StatBarView(statName: "hp", percentage: 65)
    StatBarView(statName: "attack", percentage: 45)
    StatBarView(statName: "defense", percentage: 78)
}
