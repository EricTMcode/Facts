//
//  Person.swift
//  Facts
//
//  Created by Eric on 27/03/2025.
//

import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var emailAddress: String
    var details: String
    var meetAt: Event?

    init(name: String, emailAddress: String, details: String, meetAt: Event? = nil) {
        self.name = name
        self.emailAddress = emailAddress
        self.details = details
        self.meetAt = meetAt
    } 
}
