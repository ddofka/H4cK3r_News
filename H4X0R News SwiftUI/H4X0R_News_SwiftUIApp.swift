//
//  H4X0R_News_SwiftUIApp.swift
//  H4X0R News SwiftUI
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//

import SwiftUI
import SwiftData

@main
struct H4X0R_News_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: StashedPost.self)
    }
}
