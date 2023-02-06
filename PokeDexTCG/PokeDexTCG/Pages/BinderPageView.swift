//
//  BinderPageView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct BinderPageView: View {
    @Binding var searchTerm: String
    @State var cards: [Card] = []
    var threeColumnGrid = [GridItem(.flexible(minimum: 80.0, maximum: 300.00)), GridItem(.flexible(minimum: 80.0, maximum: 300)), GridItem(.flexible(minimum: 80.0, maximum: 300))] // terrible hack to prevent too large rows in FS
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                ForEach(cards) { card in
                    CardView(cardId: card.id)
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.red, .gray, .white]), startPoint: .top, endPoint: .bottom))
        .task {
            await search()
        }
    }
    
    func search() async {
        do {
            if (searchTerm.count < 1 || searchTerm.isEmpty) {
                searchTerm = "Mr. Mime"
            }
            self.cards = try await PokeService.instance.getCardsBasedOnQuery(queryParams: ["name": searchTerm, "supertype": "Pokémon"])
        } catch {
            print(error)
        }
    }
}

