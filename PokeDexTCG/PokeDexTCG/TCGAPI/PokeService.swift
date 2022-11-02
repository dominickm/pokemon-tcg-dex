//
//  PokeService.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

class PokeService {
    
    let instance = PokeService(apiKey: Bundle.main.infoDictionary?["POKE_KEY"] as? String)

    let baseUrl = "https://api.pokemontcg.io/v2/cards/"
    let apiKey: String?
    
    private init(apiKey: String?) {
        self.apiKey = apiKey
    }
    
    func getCardById(id: String) {
        
    }
}
