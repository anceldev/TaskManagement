//
//  User.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 23/2/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var email: String
    var avatar: String
    var projects: [Project] // Many to many relationship with Project model

    init(name: String = "", email: String = "", avatar: String = "", projects: [Project] = []) {
        self.name = name
        self.email = email
        self.avatar = avatar
        self.projects = projects
    }
}
