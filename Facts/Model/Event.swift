//
//  Event.swift
//  Facts
//
//  Created by Eric on 28/03/2025.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var people = [Person]()



    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
