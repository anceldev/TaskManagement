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
    var taskm: Project?
    
    init(taskDescription: String = "", completed: Bool = false, taskM: Project? = nil) {
        self.taskDescription = taskDescription
        self.completed = completed
    }
}
