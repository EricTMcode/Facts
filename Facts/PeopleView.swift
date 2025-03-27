//
//  PeopleView.swift
//  Facts
//
//  Created by Eric on 27/03/2025.
//

import SwiftData
import SwiftUI

struct PeopleView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var people: [Person]

    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        } 
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
    PeopleView()
}
