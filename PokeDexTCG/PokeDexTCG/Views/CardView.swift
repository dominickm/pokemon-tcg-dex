//
//  CardView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct CardView: View {
    @State var card: Card?
    @State var isFaceUp = true
    @State var backAngle = 0.0
    @State var faceAngle = -90.0
    
    let animationDuration : CGFloat = 0.3

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
        ZStack {
            CardFrontView(angle: $faceAngle, cardId: self.cardId)
            CardFrontView(angle: $backAngle, cardId: "g1-1")
        }
        .padding()
        .onTapGesture {
            self.flip()
        }
    }
    
    func flip() {
        self.isFaceUp = !self.isFaceUp
        if self.isFaceUp {
            withAnimation(.linear(duration: animationDuration)) {
                backAngle = 90
            }
            withAnimation(.linear(duration: animationDuration).delay(animationDuration)){
                faceAngle = 0
            }
        } else {
            withAnimation(.linear(duration: animationDuration)) {
                faceAngle = -90
            }
            withAnimation(.linear(duration: animationDuration).delay(animationDuration)){
                backAngle = 0
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
