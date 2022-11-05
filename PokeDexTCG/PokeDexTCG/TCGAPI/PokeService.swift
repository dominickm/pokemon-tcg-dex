//
//  PokeService.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

class PokeService {
    
    static var instance = PokeService(apiKey: "c96ad60c-11f2-4b5b-be4d-872d57342378")
    
    let baseUrl = "https://api.pokemontcg.io/v2/cards/"
    let apiKey: String
    
    private init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func urlRequestFromUrlString(urlString: String, method: String) -> URLRequest {
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = method
        request.addValue(self.apiKey, forHTTPHeaderField: "X-Api-Key")
        return request
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
            guard queryParams[key]!.isEmpty else {
                queryString = key + ":" + queryParams[key]! + " "
                continue
            }
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.pokemontcg.io"
        urlComponents.path = "/v2/cards"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: queryString)
        ]
        let (data, _) = try await URLSession.shared.data(from: urlComponents.url!)
        let queryResult = try JSONDecoder().decode(CardQueryResult.self, from: data)
        let cards = queryResult.data
        return cards
    }
}
