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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
