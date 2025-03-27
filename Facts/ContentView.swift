//
//  ContentView.swift
//  Facts
//
//  Created by Eric on 27/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query var people: [Person]

    @State private var path = [Person]()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(people) { person in
                    NavigationLink(value: person) {
                        Text(person.name)
                    }
                }
                .onDelete(perform: deletePeople)
            }
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(person: person)
            }
            .toolbar {
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
        }
    }

    private func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
        try? modelContext.save()
    }

    private func deletePeople(at offsets: IndexSet) {
        for offset in offsets {
            let person = people[offset]
            modelContext.delete(person)
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
}
