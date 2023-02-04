//
//  SideBarView.swift
//  PokeDexTCG
//
//  Created by mike on 2/3/23.
//

import SwiftUI

struct SideBarView: View {
    @State private var query = ""
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    BinderPageView()
                } label: {
                    Label("Binder", systemImage: "book.closed")
                }
                Label("About", systemImage: "info.circle")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pokemon TCG DEX")
        }.searchable(text: $query)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
