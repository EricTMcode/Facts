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
    @Bindable var person: Person

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)

                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }

            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }

            Button("Save", action: addPerson)

        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func addPerson() {
        try? modelContext.save()
    }
}

//#Preview {
//    EditPersonView()
//}
