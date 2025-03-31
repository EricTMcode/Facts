//
//  EditPersonView.swift
//  Facts
//
//  Created by Eric on 27/03/2025.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var navigationPath: NavigationPath
    @Bindable var person: Person

    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)

                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }

            Section("Where did you meet them?") {
                Picker("Met at", selection: $person.meetAt) {
                    Text("Unknown event")
                        .tag(Optional<Event>.none)

                    if events.isEmpty == false {
                        Divider()

                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                }

                Button("Add a new event", action: addEvent)
            }

            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }

            Button("Save", action: addPerson)

        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
    }

    private func addPerson() {
        try? modelContext.save()
    }


    private func addEvent() {
        let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
        try? modelContext.save()
    }
}

#Preview {
    let person = Person(name: "Dave Lister", emailAddress: "dave@reddwarf.com", details: "")

    return EditPersonView(person: person, NavigationPath: .constant(NavigationPath()))
        .modelContainer(for: Person.self)
}
