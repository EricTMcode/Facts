//
//  Previewer.swift
//  Facts
//
//  Created by Eric on 31/03/2025.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person

    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)

        event = Event(name: "Dimension Jump", location: "Nottingham")
        person = Person(name: "Dave Lister", emailAddress: "dave@reddwarf.com", details: "", meetAt: event)

        container.mainContext.insert(person)
    }
}
