//
//  PokeService.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

class PokeService {
    
    static var instance = PokeService(apiKey: Bundle.main.infoDictionary!["API_KEY"] as! String)
    
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
    
    func urlRequestFromUrlComponents(urlComponents: URLComponents, method: String) -> URLRequest {
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method
        request.addValue(self.apiKey, forHTTPHeaderField: "X-Api-Key")
        return request
    }
    
    func getCardById(id: String) async throws -> Card {
        let (data, _) = try await URLSession.shared.data(for: self.urlRequestFromUrlString(urlString: baseUrl + id, method: "GET"))
        let cardResult = try JSONDecoder().decode(CardResult.self, from: data)
        let card = cardResult.data
        return card
    }
    
    func getCardsBasedOnQuery(queryParams: Dictionary<String, String>) async throws -> [Card] {
        var queryString = ""
        let bQuote = "\""
        let eQuote = "\""
        for key in queryParams.keys {
            guard queryParams[key]!.isEmpty else {
                let doubleQuoted = bQuote + queryParams[key]! + eQuote
                queryString = key + ":" + doubleQuoted
                continue
            }
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.pokemontcg.io"
        urlComponents.path = "/v2/cards"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "pagesize", value: "12"),
            URLQueryItem(name: "q", value: queryString)
        ]
        let (data, _) = try await URLSession.shared.data(for: self.urlRequestFromUrlComponents(urlComponents: urlComponents, method: "GET"))
        let queryResult = try JSONDecoder().decode(CardQueryResult.self, from: data)
        let cards = queryResult.data
        return cards
    }
}
