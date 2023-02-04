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
                    BinderPageView()
                } label: {
                    Label("Binder", systemImage: "book.closed")
                }
                Label("About", systemImage: "info.circle")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pokemon TCG DEX")
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
