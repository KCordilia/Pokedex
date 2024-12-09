//
//  TypeView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 09/12/2024.
//

import SwiftUI

struct TypeView: View {
    let type: String
    
    var body: some View {
        Text(type.capitalized)
            .frame(width: 60, height: 25)
            .background(TypeColorMapper.getTypeColor(for: type))
            .clipShape(.capsule)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color.white)
    }
}

#Preview {
    TypeView(type: MockData.createSampleTypes().first!.name)
    
}
