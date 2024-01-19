//
//  Step.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation
import SwiftData

@Model
class Step {
    var stepDescription: String
    var completed: Bool
    var taskm: TaskM?
    
    init(stepDescription: String = "", completed: Bool = false, taskM: TaskM? = nil) {
        self.stepDescription = stepDescription
        self.completed = completed
    }
}
