//
//  PokemonCryPlayer.swift
//  Pokedex
//
//  Created by Karim Cordilia on 18/12/2024.
//

import Foundation
import VLCKitSPM

class PokemonCryPlayer {
    private var player: VLCMediaPlayer?
    
    func playCry(from url: URL) {
        let media = VLCMedia(url: url)
        player = VLCMediaPlayer()
        player?.media = media
        player?.play()
    }
}
