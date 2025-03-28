//
//  EditEventView.swift
//  Facts
//
//  Created by Eric on 28/03/2025.
//

import SwiftData
import SwiftUI

struct EditEventView: View {

    @Bindable var event: Event

    var body: some View {
        Form {
            TextField("Name of event", text: $event.name)
            TextField("Location", text: $event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}
