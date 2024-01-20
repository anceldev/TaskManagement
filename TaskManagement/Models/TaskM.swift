//
//  Task.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation
import SwiftData

@Model
class TaskM {
    var name: String
    var taskDescription: String
    var priority: Priority
    var expireDate: Date?
    var progress: Int
    var colorHex: String
    @Relationship(deleteRule: .cascade, inverse: \Step.taskm) var steps: [Step]?
    
    
    init(name: String = "", taskDescription: String = "", priority: Priority = .normal, expireDate: Date? = .now, progress: Int = 0, colorHex: String = "", steps: [Step]? = []) {
        self.name = name
        self.taskDescription = taskDescription
        self.priority = priority
        self.expireDate = expireDate
        self.progress = progress
        self.steps = steps
        self.colorHex = colorHex
    }
}
