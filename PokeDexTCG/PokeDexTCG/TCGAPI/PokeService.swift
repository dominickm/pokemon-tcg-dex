//
//  PokeService.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

class PokeService {
    
    static var instance = PokeService(apiKey: Bundle.main.infoDictionary?["POKE_KEY"] as? String)
    
    let baseUrl = "https://api.pokemontcg.io/v2/cards/"
    let apiKey: String?
    
    private init(apiKey: String?) {
        self.apiKey = apiKey
    }
    
    func getCardById(id: String) async throws {
        let (data, _) = try await URLSession.shared.data(from: URL(string: baseUrl + id)!)
        do {
            let cardResult = try JSONDecoder().decode(CardResult.self, from: data)
            let card = cardResult.data
            print(card)
        } catch let error {
            print(error)
        }
        print(data)
    }
    
}
