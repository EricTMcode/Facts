//
//  FactsApp.swift
//  Facts
//
//  Created by Eric on 27/03/2025.
//

import SwiftUI

@main
struct FactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Person.self)
    }
}
