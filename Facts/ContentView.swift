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


    @State private var path = [Person]()
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path) {
            PeopleView(searchString: searchText)
                .navigationTitle("FaceFacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person)
                }
                .toolbar {
                    Button("Add Person", systemImage: "plus", action: addPerson)
                }
                .searchable(text: $searchText)
        }
    }

    private func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
        try? modelContext.save()
    }

}

#Preview {
    ContentView()
}
