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
    
    
    init(name: String = "", email: String = "", avatar: String = "") {
        self.name = name
        self.email = email
        self.avatar = avatar
    }
}
