//
//  LoadingView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 08/01/2025.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    var body: some View {
        LottieView(animation: .named("PokeballLoading"))
            .playing(loopMode: .loop)
    }
}

#Preview {
    LoadingView()
}
