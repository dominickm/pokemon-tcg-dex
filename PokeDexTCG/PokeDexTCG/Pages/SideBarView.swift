//
//  SideBarView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    BinderPageView(searchTerm: "")
                } label: {
                    Label("Binder", systemImage: "book.closed")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pokemon TCG DEX")
            BinderPageView(searchTerm: "")
        }
        .task {
            _ = await Card.dittoCard()
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
