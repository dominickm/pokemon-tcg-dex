//
//  BinderPageView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct BinderPageView: View {    
    var body: some View {
        VStack {
            Grid() {
                GridRow {
                    CardView(cardId: "xy7-5")
                    CardView(cardId: "det1-4")
                    CardView(cardId: "xy2-1")
                }
                GridRow {
                    CardView(cardId: "pl1-1")
                    CardView(cardId: "mcd19-1")
                    CardView(cardId: "xy1-1")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.red, .gray, .white]), startPoint: .top, endPoint: .bottom))
    }
}


struct BinderPageView_Previews: PreviewProvider {
    static var previews: some View {
        BinderPageView()
    }
}
