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
    private var threeColumnGrid = [GridItem(.flexible(minimum: 80.0, maximum: 300.00)), GridItem(.flexible(minimum: 80.0, maximum: 300)), GridItem(.flexible(minimum: 80.0, maximum: 300))] // terrible hack to prevent too large rows in FS
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                CardView(cardId: "basep-12")
                CardView(cardId: "mcd19-1")
                CardView(cardId: "hgss2-13")
                CardView(cardId: "pl1-1")
                CardView(cardId: "basep-8")
                CardView(cardId: "xy1-1")
            }
        }
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
