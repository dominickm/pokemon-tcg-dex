//
//  BinderPageView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct BinderPageView: View {
    @State var searchTerm: String
    @State var cards: [Card] = []
    let threeColumnGrid = [GridItem(.flexible(minimum: 80.0, maximum: 300.00)), GridItem(.flexible(minimum: 80.0, maximum: 300)), GridItem(.flexible(minimum: 80.0, maximum: 300))] // terrible hack to prevent too large rows in FS
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(cards) { card in
                    CardView(cardId: card.id)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.red, .gray, .white]), startPoint: .top, endPoint: .bottom))
        .task(id: searchTerm) {
            await search()
        }
        .searchable(text: $searchTerm, prompt: "Search for a Pokemon")
        .onAppear {
            searchTerm = "pikachu"
        }
    }
    
    func search() async {
        print(searchTerm)
        if searchTerm.count < 4 {
            return
        }
        do {
            self.cards = try await PokeService.instance.getCardsBasedOnQuery(queryParams: ["name": searchTerm, "supertype": "Pokémon"])
        } catch {
            print(error)
        }
    }
}

