//
//  Card.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

// For now we assume all cards are Pokemon, because that's all the boy cares about :)

struct Card: Decodable, Identifiable {
    var id: String
    var artist: String
    var rarity: String?
    var number: String
    var nationalPokedexNumbers: Array<Int>
    var name: String
    var hp: String
    var types: Array<String>
    var evolvesFrom: String?
    var evolvesTo: Array<String>?  // we assume a list of len 0 is a final evolve state
    var images: Dictionary<String, URL>
    var weaknesses: Array<Dictionary<String, String>>?
    var retreatCost: Array<String>?
    var convertedRetreatCost: Int?
    var subtypes: Array<String>
    
    static func dittoCard() async -> Card {
        return await cardFromId(id: "swsh45-50")
    }
    
    static func cardFromId(id: String) async -> Card {
        var card: Card? = nil
        do {
            card = try await PokeService.instance.getCardById(id: id)
        } catch {
            print("failed to pull card")
            print(error)
        }
        return card!
    }
    
    var lowResImageURL: URL? {
        return self.images["small"]
    }
    
    var highResImageURL: URL? {
        return self.images["large"]
    }
    
    var isBasic: Bool {
        var isBasic = false
        if self.subtypes.contains("Basic") {
            isBasic = true
        }
        return isBasic
    }
    
    var hasEvolution: Bool {
        return !(self.evolvesTo?.isEmpty ?? true)
    }
}
