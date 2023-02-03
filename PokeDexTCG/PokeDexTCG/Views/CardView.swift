//
//  CardView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct CardView: View {
    @State var card: Card?
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
            await loadCard()
        }
    }
    
    func loadCard() async {
        do {
            let card = try await PokeService.instance.getCardById(id:"xy1-1")
            self.card = card
            print(self.card!)
        } catch {
            print("failed")
            print(error)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
