//
//  BinderPageView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct BinderPageView: View {
    var cards: [Card] = []
    var searchTerm: String?
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                CardView(cardId: "pl1-1")
                CardView(cardId: "mcd19-1")
                CardView(cardId: "xy1-1")
                CardView(cardId: "pl1-1")
                CardView(cardId: "mcd19-1")
                CardView(cardId: "xy1-1")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.red, .gray, .white]), startPoint: .top, endPoint: .bottom))
    }
    
    mutating func search() async {
        do {
            self.cards = try await PokeService.instance.getCardsBasedOnQuery(queryParams: ["name": searchTerm!])
        } catch {
            print(error)
        }
    }
}


struct BinderPageView_Previews: PreviewProvider {
    static var previews: some View {
        BinderPageView()
    }
}
