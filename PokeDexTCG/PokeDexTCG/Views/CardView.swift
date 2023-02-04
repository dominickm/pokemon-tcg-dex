//
//  CardView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct CardView: View {
    @State var card: Card?
    var cardId: String
    
    init(card: Card? = nil) {
        self.card = card
        self.cardId = card!.id
    }
    
    init(cardId: String) {
        self.cardId = cardId
        print(self.cardId)
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
            await self.loadCard(id: self.cardId)
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
