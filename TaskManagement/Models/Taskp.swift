//
//  Step.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation
import SwiftData

@Model
class Taskp {
    var taskDescription: String
    var completed: Bool
    var user: User?
    var project: Project?
    
    init(taskDescription: String = "", completed: Bool = false, user: User? = nil, project: Project? = nil) {
        self.taskDescription = taskDescription
        self.completed = completed
        self.user = user
        self.project = project
    }
}
