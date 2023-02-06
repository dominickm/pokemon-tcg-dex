//
//  PokeDexTCGApp.swift
//  PokeDexTCG
//
//  Created by mike on 11/1/22.
//

import SwiftUI

@main
struct PokeDexTCGApp: App {
    
    init() {
        URLCache.shared.memoryCapacity = 80_000_000
        URLCache.shared.diskCapacity = 1_000_000_000
    }
    
    var body: some Scene {
        WindowGroup {
            SideBarView()
        }
    }
}
