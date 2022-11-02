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
    
    func getCardById(id: String) async throws -> Card {
        let (data, _) = try await URLSession.shared.data(from: URL(string: baseUrl + id)!)
        let cardResult = try JSONDecoder().decode(CardResult.self, from: data)
        let card = cardResult.data
        return card
    }
    
    func getCardsBasedOnQuery(queryParams: Dictionary<String, String>) async throws -> [Card] {
        var queryString = ""
        for key in queryParams.keys {
            if queryParams[key] != nil {
                queryString = key + ":" + queryParams[key] + " "
            }
        }
        let (data, _) = try await URLSession.shared.data(from: URL(string: baseUrl + "?q=" + queryString))
        let queryResult = try JSONDecoder().decode(CardQueryResult.self, from: data)
        let cards = queryResult.data
        return cards
}
