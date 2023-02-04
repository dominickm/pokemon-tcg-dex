//
//  CardFrontView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct CardFrontView: View {
    @Binding var angle: Double
    @State var card: Card?
    var cardId: String
    
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
        }.rotation3DEffect(Angle(degrees: angle), axis: (x: 0, y: 1, z: 0))
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

