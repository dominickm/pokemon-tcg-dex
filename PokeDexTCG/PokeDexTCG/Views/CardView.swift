//
//  CardView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct CardView: View {
    @State var card: Card?
    @State var cardId: String?
    
    init(card: Card? = nil) {
        self.card = card
    }
    
    init(cardId: String) {
        self.cardId = cardId
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: card?.lowResImageURL,
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
            },
                       placeholder: {
                ProgressView()
            })
        }
        .padding()
        .task {
            await loadCard(id: cardId)
        }
    }
    
    func loadCard(id: String?) async {
        if id == nil {
            card = await Card.cardFromId(id: "xy1-1") // placeholder
        } else {
            card = await Card.cardFromId(id: id!)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
