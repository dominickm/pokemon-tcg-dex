//
//  Card.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import Foundation

// For now we assume all cards are Pokemon, because that's all the boy cares about :)

struct Card: Decodable {
    var id: String
    var name: String
    var hp: String
    var types: Array<String>
    var evolvesFrom: String?
    var evolvesTo: Array<String>  // we assume a list of len 0 is a final evolve state
    var images: Dictionary<String, URL>
    
    var lowResImageURL: URL? {
        return self.images["small"]
    }
    
    var highResImageURL: URL? {
        return self.images["large"]
    }
}
