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
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Pokemon TCG DEX")
            BinderPageView()
        }
        .searchable(text: $query)
        .onSubmit(of: .search) {
            search(term: query)
        }
    }
    
    func search(term: String) {
        
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
