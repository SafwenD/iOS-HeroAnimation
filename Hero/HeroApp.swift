//
//  HeroApp.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import SwiftUI

@main
struct HeroApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onAppear {
                    URLCache.shared.memoryCapacity = 10_000_000 // ~10 MB memory space
                    URLCache.shared.diskCapacity = 1_000_000_000 // ~1GB disk cache space
                }
        }
    }
}
