//
//  PokeService.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

let sharedPokeService = PokeService(apiKey: Bundle.main.infoDictionary?["POKE_KEY"] as? String)

class PokeService {
    let baseUrl = "https://api.pokemontcg.io/v2/cards/"
    let apiKey: String?
    
    init(apiKey: String?) {
        self.apiKey = apiKey
    }
}
