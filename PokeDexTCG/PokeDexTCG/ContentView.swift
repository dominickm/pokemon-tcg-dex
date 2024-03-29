//
//  ContentView.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var card: Card?
    var body: some View {
        VStack {
            AsyncImage(url: card?.highResImageURL,
                       content: { image in
                           image.resizable()
                    .aspectRatio(contentMode: .fill)
                                .scaledToFit()
                       },
                       placeholder: {
                           ProgressView()
                       })
        }.background(Image("charizard-bg.jpg")
            .resizable()
            .scaledToFit())
        .padding()
        .task {
            await loadCard()
        }
    }
    
    func loadCard() async {
        do {
            let card = try await PokeService.instance.getCardById(id:"xy2-1")
            self.card = card
            print(self.card!)
        } catch {
            print("failed")
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
